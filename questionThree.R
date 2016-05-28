# questionThree.R
## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/questionThree.R
## Description: Answer question three in Exploratory Data Analysis Project 2
## Date: May 28, 2016
## Author: James Portman

## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/loadData.r
source("loadData.R")

## Aggregate total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") from 1999 to 2008.
df_baltimore_NEI <- df_NEI[df_NEI$fips=="24510",]
aggregatedTotalsBaltimore <- aggregate(Emissions ~ year, df_baltimore_NEI, sum)

## Load ggplot2
library(ggplot2)

ggp <- ggplot(df_baltimore_NEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

## End questionThree.R