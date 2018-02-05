## Coursera Data Science: Exploratory Data Analysis
## Course project 1: Plot1.R
##===================================================================

## Clear the environment
rm(list = ls())

## load the data
pwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data
subpwr <- subset(pwr,pwr$Date=="1/2/2007" | pwr$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpwr$Date <- as.Date(subpwr$Date, format="%d/%m/%Y")
subpwr$Time <- strptime(subpwr$Time, format="%H:%M:%S")
subpwr[1:1440,"Time"] <- format(subpwr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpwr[1441:2880,"Time"] <- format(subpwr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(subpwr$Time,as.numeric(as.character(subpwr$Global_active_power)),type="l",
     xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

## Save file

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)