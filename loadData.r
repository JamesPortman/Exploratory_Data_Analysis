# loadData.R
## Description: Load in data required for answering Project questions
## # Date: May 28, 2016
## Author: James Portman

setwd("/Users/admin/ExploratoryProject2/")

## Create the NEI and SCC data frames from the .rds files.
df_NEI <- readRDS("summarySCC_PM25.rds")
df_SCC <- readRDS("Source_Classification_Code.rds")

## End loadData.R
