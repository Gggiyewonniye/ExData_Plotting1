## Coursera Data Science: Exploratory Data Analysis
## Course project 1: Plot1.R
##===================================================================

## Clear the environment
rm(list = ls())

## load the data
pwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data
subpwr <- subset(pwr,pwr$Date=="1/2/2007" | pwr$Date =="2/2/2007")

## Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpwr$Date <- as.Date(subpwr$Date, format="%d/%m/%Y")
subpwr$Time <- strptime(subpwr$Time, format="%H:%M:%S")
subpwr[1:1440,"Time"] <- format(subpwr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpwr[1441:2880,"Time"] <- format(subpwr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


## initiating a composite plot with many graphs
par(mfrow=c(2,2))

## calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subpwr,{
  plot(subpwr$Time,as.numeric(as.character(subpwr$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpwr$Time,as.numeric(as.character(subpwr$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpwr$Time,subpwr$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpwr,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpwr,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpwr,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpwr$Time,as.numeric(as.character(subpwr$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

## Save file

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(data)