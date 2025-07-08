#Load packages
library(gtsummary)
library(gt)
library(tidyverse)
library(flextable)


#Load data
data<- readxl::read_excel("Data/HBV Data_All_WS.xlsx", sheet = 6)

median(data$Total_KAP_Score)


#Knowledge of prevention by Institution, Field of study , Area of residence
data |>
  select(`Vaccination_status` , 1:3) |>
  tbl_summary(by = `Vaccination_status`) |>
  add_overall() |>
  add_p(test.args = all_tests("fisher.test") ~ list(workspace=2e9)) |>
  bold_p() |> 
  as_gt() |>
  gtsave("Tables/Table2.docx")


