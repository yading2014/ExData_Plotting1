lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))

data <- read.csv('household_power_consumption.txt',skip= lines[1]-2,nrows=length(lines), sep=";" )

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab= "Frequency", main="Global Active Power")
dev.off()

#Another way of doing it 
#dev.copy(png,'plot1.png')
