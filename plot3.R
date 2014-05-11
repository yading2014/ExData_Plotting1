lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
data <- read.csv('household_power_consumption.txt',skip= lines[1]-2,nrows=length(lines), sep=";" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

timeorder <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
Sub_metering_1 <- data$Sub_metering_1
Sub_metering_2 <- data$Sub_metering_2
Sub_metering_3 <- data$Sub_metering_3

png(filename="plot3.png", width=480, height=480)
par(mfrow=c(1,1))
plot(timeorder, Sub_metering_1, type="l", col="black",new=TRUE, ylab="Engergy sub metering", xlab="")
points(timeorder, Sub_metering_2, type="l", col="red",new=TRUE)
points(timeorder, Sub_metering_3, type="l", col="blue",new=TRUE)
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

