#Load packages
library(gtsummary)
library(gt)
library(tidyverse)
library(flextable)


#Load data
data<- readxl::read_excel("Data/HBV Data_All_WS.xlsx", sheet = 6)

colnames(data)

data1<- cor_matrix<- cor(data$Total_Knowledge_Score, data$Total_Attitude_Score,
                method = "spearman") 
cor_table1 <- as.data.frame(cor_matrix) 
print(cor_table1)

data2 <-cor_matrix<- cor(data$Total_Attitude_Score,data$Total_Practice_score,
                 method = "spearman") 
cor_table2 <- as.data.frame(cor_matrix) 
print(cor_table2)

data3 <- cor_matrix<- cor(data$Total_Knowledge_Score, data$Total_Practice_score,
                 method = "spearman") 
cor_table3 <- as.data.frame(cor_matrix) 
print(cor_table3)


   