#Install packages
install_pckgs<-
  c("likert", "ggthemes" , "RColorBrewer", "ggpubr")
install.packages(install_pckgs)

# Load packages
library(tidyverse)
library(likert)
library(ggpubr)
library(ggthemes)
library(RColorBrewer)


# Load data
data <- readxl::read_excel("Data/HBV Data_All.xlsx")

#Distribution of knowledge about vaccination
knowledge_df<- data |>
  select(7:21) |>
  mutate_if(is.character, as.factor) |>
  as.data.frame()

fig1 <- plot(likert(knowledge_df) ,
             ordered = FALSE,
             group.order = names(knowledge_df),
             centre = 2)
fig1 + theme_pubr()

ggsave("Figures/knowledge.tiff", units = "in", width = 12,
       height = 10, dpi = 600, compression = "lzw")



# Distribution of attitude about vaccination
data<- readxl::read_excel("Data/HBV Data_All_WS.xlsx", sheet = 2)

attitude_df <- data |>
  select(22:27) |>
  mutate_if(is.character, as.factor) |>
  as.data.frame()

fig2 <- plot(likert(attitude_df) ,
             ordered = FALSE,
             group.order = names(attitude_df),
            centre = 2)

fig2 + theme_pubr()

ggsave("Figures/attitude.tiff", units = "in", width = 12,
       height = 10, dpi = 600, compression = "lzw" )

# Distribution of practice
practice_df <- data |>
  select(28:33) |>
  mutate_if(is.character, as.factor) |>
  as.data.frame()

fig3 <- plot(likert(practice_df) ,
             ordered = FALSE,
             group.order = names(practice_df),
             centre = 2)

fig3 + theme_pubr()

ggsave("Figures/practice.tiff", units = "in", width = 12,
       height = 10, dpi = 600, compression = "lzw" )

