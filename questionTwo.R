# questionTwo.R
## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/questionOne.R
## Description: Answer question two in Exploratory Data Analysis Project 2
## Date: May 28, 2016
## Author: James Portman

## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/loadData.r
source("loadData.R")

## Aggregate total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") from 1999 to 2008.
df_baltimore_NEI <- df_NEI[df_NEI$fips=="24510",]

aggregatedTotalsBaltimore <- aggregate(Emissions ~ year, df_baltimore_NEI, sum)

## Plot data.
barplot(
  aggregatedTotalsBaltimore$Emissions,
  names.arg=aggregatedTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

## End questionTwo.R