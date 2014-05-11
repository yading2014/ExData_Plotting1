lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
data <- read.csv('household_power_consumption.txt',skip= lines[1]-2,nrows=length(lines), sep=";" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

timeorder <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(timeorder,data$Global_active_power, type="l", ylab="Global Active Power (Kilwatts)", xlab="")
dev.off()

