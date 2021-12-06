library(rvest)
library(tidyverse)
# vær klar til at justere pageSize.
# evt hent side, træk oplysninger, og juster pageSize
tidl_medlemmer_base <- "https://www.ft.dk/da/medlemmer/find-tidligere-medlemmer?q=&sf=&msf=&as=1&Funktion=Fhv.%20medlem%20af%20Folketinget&pageSize="

# vi starter med at hente de første 20 resultater
start_størrelse <- "20"




# Så trækker vi det samlede antal resultater ud
antal_res <- rvest::read_html(paste0(tidl_medlemmer_base, start_størrelse)) %>%
  html_element("body") %>%
  html_element(xpath='//*[@id="ContentArea"]/div[5]/div/div/div[2]/div/div/div[1]/span[2]') %>%
  html_text() %>%
  str_extract("(?<=af\\s)\\d*") %>%
  as.numeric()

# Og så henter vi det samlede antal resultater + 10
data <- rvest::read_html(paste0(tidl_medlemmer_base, antal_res+10))

# trækker de enkelte medlemmers elementer ud
medlemmer <- data %>%
  html_element("body") %>%
  html_elements(xpath = '//*[@id="ContentArea"]/div[5]/div/div/div[3]/table/tbody') %>%
  html_children()

# her kan vi teste om length(medlemmer) er lig antal_res


# funktion til at skrabe data ud af elementerne

initiel_skrab <- function(element){

  link <- element %>%
    html_element(css='td.lefty.list3') %>%
    html_element(css='p') %>%
    html_element(css="a") %>%
    html_attr('href')


    link_text <- element %>%
    html_element(css='td.lefty.list3') %>%
    html_element(css='p') %>%
    html_text(trim=T)
  extra_text <- element %>%
    html_element(css= 'td.righty') %>%
    html_text(trim=T)
  return(c(link=link, link_text=link_text, extra_text=extra_text))
}


# så piller vi data ud.
medlemmer <- medlemmer %>%
  map_dfr(initiel_skrab)

# dernæst skal vi have hentet

skrab_person_side <- function(x){
  urlen <- x
  url <- url(x, "rb")
  test <- read_html(url)
  close(url)


  billed_link <- test %>% html_element("body")  %>%
    html_element(xpath='//*[@id="ContentArea"]/div[4]/div[1]/div/div[1]/img') %>%
    html_attr("src")
  billed_alt <- test %>% html_element("body")  %>%
    html_element(xpath='//*[@id="ContentArea"]/div[4]/div[1]/div/div[1]/img') %>%
    html_attr("alt")
  df <- test %>% html_element("body") %>%
    html_elements(xpath = '//*[@id="ftMember__accordion__container__tab1"]/div/section')
  overskrifter <- df %>% html_element(css="strong") %>% html_text()
  texter <- df %>% html_text(trim=T)
  overskrifter <- c("url", "billed_link", "billed_alt", overskrifter)
  texter <- c(urlen, billed_link, billed_alt, texter)
  tibble(overskrifter = overskrifter, texter = texter)
}


skrab_person_side <- possibly(skrab_person_side, NA)


resultat <- medlemmer %>%
  mutate(skrabet = map(link, skrab_person_side))


save(resultat, file="data-raw/foreløbigeresultater.rda")
load(file="data-raw/foreløbigeresultater.rda")

resultat %>% unnest(skrabet) %>%
  pivot_wider(id_cols = link,
              names_from = overskrifter,
              values_from = texter,
              values_fill = NA) %>%
  select(link, Medlemsperiode, `Parlamentarisk karriere`) %>%
  unnest(Medlemsperiode) %>%
  unnest(`Parlamentarisk karriere`) %>%
  mutate(Medlemsperiode = str_remove(Medlemsperiode, "Medlemsperiode")) %>%
  rename(pk = `Parlamentarisk karriere`) %>%
  mutate(pk = str_remove(pk, "Parlamentarisk karriere")) %>%
  select(-pk)  %>%
  separate_rows(Medlemsperiode, sep= "\\r\\n") %>%
  mutate(Medlemsperiode = str_squish(Medlemsperiode)) %>%
  filter(Medlemsperiode != "") %>%
  mutate(datoer = str_extract_all(Medlemsperiode, "\\d{1,2}\\.\\s\\w{3,9}\\s\\d{4}")) %>%
  mutate(id = 1:n()) %>%
  rowwise() %>%
  mutate(datoer = str_c(datoer, collapse="¤")) %>%
  separate(datoer, sep = "¤", into=c("start", "slut")) %>%
  view
