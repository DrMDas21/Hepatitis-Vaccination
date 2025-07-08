#Load packages
library(gtsummary)
library(gt)
library(tidyverse)
library(flextable)


#Load data
data<- readxl::read_excel("Data/HBV Data_All_WS.xlsx", sheet = 6)

median(data$Total_KAP_Score)

data |>
  select(`Academic status`, 11:12) |>
  tbl_summary(by = `Academic status`) |>
  add_overall() |>
  add_p(test.args = all_tests("kruskal.test") ~ list(workspace=2e9)) |>
  bold_p() |> 
  as_gt() |>
  gtsave("Tables/Table3.docx")
