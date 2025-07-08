# Load packages
library(gtsummary)
library(tidyverse)
library(gt)

# Load data
data <- readxl::read_excel("Data/HBV Data_All.xlsx", sheet= 2)

summary(data)

colnames(data)
rownames(data)
table(data$`Academic Year`)

# Normally distributed or not?

hist(data$Age)


#Table1 : Demographic variables
data |>
  select(1:7) |>
  tbl_summary(missing= "no" ,
              type= everything() ~ "categorical" ) |>
  as_gt()|>
  gtsave("Tables/Table1.docx")


