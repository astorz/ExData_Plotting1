## Creates Plot 2
## NOTE: Don't forget to set the working directory

## Reading the data
library(data.table)
DT <- fread("household_power_consumption.txt", colClasses="numeric", header=TRUE, na.strings="?")

## Subsetting and preparing the data (February 1-2, 2007)
myData <- DT[66637:69516,]
DF <- data.frame(myData, )
x <- paste(DF$Date, DF$Time)
DF$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")
DF$Global_active_power <- as.numeric(DF$Global_active_power)


## Creating the line graph /
## saving it to a .png graphics device
png(file = "plot2.png", width = 480, height = 480)
plot(DF$datetime, DF$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(DF$datetime, DF$Global_active_power, lwd=1)
dev.off()
