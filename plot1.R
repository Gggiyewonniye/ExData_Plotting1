## Coursera Data Science: Exploratory Data Analysis
## Course project 1: Plot1.R
##===================================================================

## Clear the environment
rm(list = ls())

## load the data
pwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data
subpwr <- subset(pwr,pwr$Date=="1/2/2007" | pwr$Date =="2/2/2007")

## plot 1
hist(as.numeric(as.character(subpwr$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Save file

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)