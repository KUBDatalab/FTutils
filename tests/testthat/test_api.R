library(testthat)
context("api endpoints")

skip_if_offline(host = "oda.ft.dk")

# simple test for one endpoint

test_that("endpoint returns data", {
  res <- afstemning(`$top` = 1)
  expect_true(is.list(res) || is.data.frame(res))
})
