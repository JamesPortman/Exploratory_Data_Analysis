# questionFive.R
## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/questionFive.R
## Description: Answer question four in Exploratory Data Analysis Project 2
## Date: May 28, 2016
## Author: James Portman

## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/loadData.R
source("loadData.R")

## subset the motor vehicles
vehicles <- grepl("vehicle", df_SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- df_SCC[vehicles,]$SCC
df_vehiclesNEI <- df_NEI[df_NEI$SCC %in% vehiclesSCC,]

## Subset for motor vehicles in Baltimore
df_baltimoreVehiclesNEI <- df_vehiclesNEI[df_vehiclesNEI$fips==24510,]

## Load ggplot2
library(ggplot2)

ggp <- ggplot(df_baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

## End questionFive.R