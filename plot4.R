## Plot 4
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
DF$Sub_metering_1 <- as.numeric(DF$Sub_metering_1)
DF$Sub_metering_2 <- as.numeric(DF$Sub_metering_2)
DF$Sub_metering_3 <- as.numeric(DF$Sub_metering_3)
DF$Voltage <- as.numeric(DF$Voltage)
DF$Global_reactive_power <- as.numeric(DF$Global_reactive_power)

## Creating the graph /
## saving it to a .png graphics device
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))
par(mar = c(4, 4, 2, 2))
plot(DF$datetime, DF$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(DF$datetime, DF$Global_active_power, lwd=1)
plot(DF$datetime, DF$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(DF$datetime, DF$Sub_metering_1, lwd=1, col="black")
lines(DF$datetime, DF$Sub_metering_2, lwd=1, col="red")
lines(DF$datetime, DF$Sub_metering_3, lwd=1, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, cex=0.8, col=c("black","red","blue"), lty=c(1,1,1))
plot (DF$datetime, DF$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(DF$datetime, DF$Voltage, lwd=1)
plot (DF$datetime, DF$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(DF$datetime, DF$Global_reactive_power, lwd=1)
dev.off()
