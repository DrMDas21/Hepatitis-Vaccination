# Load packages
library(tidyverse)
library(gtsummary)
library(easystats)
library(gt)
library(ordinal)
library(MASS)


#Load data
data<- readxl::read_excel("Data/HBV Data_All_WS.xlsx", sheet = 7)

colnames(data)

#Convert into knowledge level BC
data$Vaccine_Status_Binary <- as.factor(data$Vaccine_Status_Binary)

#Table3: Factors associated with vaccination status in multivariate logistic regression

Full_Vaccination_stauts <- glm(Vaccine_Status_Binary ~
                      `Gender` +
                      `Age` +
                      `Academic_status` +
                      `Median_score_grade` ,
                       data=data
)
report(Full_Vaccination_stauts)

Vaccination_stauts |>
  tbl_regression() |>
  bold_p(t=0.05) |>
  as_gt() |>
  gtsave("Tables/Table4.docx")

