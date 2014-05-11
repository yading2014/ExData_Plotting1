lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
data <- read.csv('household_power_consumption.txt',skip= lines[1]-2,nrows=length(lines), sep=";" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

timeorder <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- data$Sub_metering_1
Sub_metering_2 <- data$Sub_metering_2
Sub_metering_3 <- data$Sub_metering_3

par(mfrow=c(2,2))

dev.copy(png,'plot4.png')


#plot 1_1 
plot(timeorder, data$Global_active_power, type="l", ylab ="Global Active Power")

#plot 1_2
plot(timeorder, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#plot 1_3

plot(timeorder, Sub_metering_1, type="l", col="black",new=TRUE, ylab="Engergy sub metering", xlab="")
points(timeorder, Sub_metering_2, type="l", col="red",new=TRUE)
points(timeorder, Sub_metering_3, type="l", col="blue",new=TRUE)
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex=0.7)

#plot 1_4
plot(timeorder, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

#png(filename="plot4.png", width=480, height=480)

dev.off()

