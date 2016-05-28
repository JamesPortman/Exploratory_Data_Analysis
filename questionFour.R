# questionFour.R
## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/questionFour.R
## Description: Answer question four in Exploratory Data Analysis Project 2
## Date: May 28, 2016
## Author: James Portman

## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/loadData.r
source("loadData.R")

# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", df_SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", df_SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC_df <- df_SCC[coalCombustion,]$SCC
combustionNEI_df <- df_NEI[df_NEI$SCC %in% combustionSCC,]

## Load ggplot2
library(ggplot2)

ggp <- ggplot(combustionNEI_df,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

## End questionFour.R