context("which_assembly")

test_that("which_assembly returnerer korrekt",{
  expect_equal(which_assembly("2021-04-01"), 20201)
}
          )

test_that("which_assembly returnerer korrekt antal samlinger",{
  expect_equal(length(which_assembly("1974-06-20:2016-04-30")), 58)
})
