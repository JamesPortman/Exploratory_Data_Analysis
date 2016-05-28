# questionOne.R
## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/questionOne.R
## Description: Answer question one in Exploratory Data Analysis Project 2
## Date: May 28, 2016
## Author: James Portman

## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/loadData.r
source("loadData.R")

aggregatedTotals <- aggregate(Emissions ~ year, df_NEI, sum)

## Use the base plotting system to plot the total PM2.5 Emission from all sources.

barplot(
  (aggregatedTotals$Emissions) / 10^6,
  names.arg = aggregatedTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Million Tons)",
  main="Total PM2.5 Emissions from all US sources"
)
## End questionOne.R
