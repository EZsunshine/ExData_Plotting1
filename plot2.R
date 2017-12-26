data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, dec=".")

datetime <- strptime(paste(data$Date, data$Time, sep=" "), format= "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

subsetdata<-subset(data,Date == "2007-02-01" | Date =="2007-02-02")

png("plot2.png", width=480, height=480)
plot(datetime, data$Global_active_power , type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

