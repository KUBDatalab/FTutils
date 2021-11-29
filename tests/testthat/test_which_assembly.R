context("which_assembly")

test_that("which_assembly returnerer korrekt",{
  expect_equal(which_assembly("2021-04-01"), 20201)
}
          )
