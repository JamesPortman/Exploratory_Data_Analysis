# questionSix.R
## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/questionSix.R
## Description: Answer question four in Exploratory Data Analysis Project 2
## Date: May 28, 2016
## Author: James Portman

## From: https://github.com/JamesPortman/Exploratory-Data-Analysis/blob/master/loadData.R
source("loadData.R")

## subset the motor vehicles
vehicles <- grepl("vehicle", df_SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- df_SCC[vehicles,]$SCC
df_vehiclesNEI <- df_NEI[df_NEI$SCC %in% vehiclesSCC,]

## Baltimore
df_vehiclesBaltimoreNEI <- df_vehiclesNEI[df_vehiclesNEI$fips == 24510,]
df_vehiclesBaltimoreNEI$city <- "Baltimore City"

## Los Angeles County
df_vehiclesLA_NEI <- df_vehiclesNEI[df_vehiclesNEI$fips == "06037",]
df_vehiclesLA_NEI$city <- "Los Angeles County"

# Combine Baltimore and Los Angeles County
df_bothNEI <- rbind(df_vehiclesBaltimoreNEI, df_vehiclesLA_NEI)

## Load ggplot2
library(ggplot2)

ggp <- ggplot(df_bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp)

## End questionSix.R