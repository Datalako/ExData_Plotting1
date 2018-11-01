#Read data from txt file 
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Read right dates
mydataset <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007",]

## put date & time together and creat a day/time format 
mydataset$DateTime <- strptime(paste(mydataset$Date, mydataset$Time), "%d/%m/%Y %H:%M:%S")

#Opening PNG Device
png(filename="plot4.png", width=480, height=480)

#Creating space for 4 plots and the plots
par(mfrow=c(2,2))
plot(mydataset$DateTime,mydataset$Global_active_power,type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
plot(mydataset$DateTime,mydataset$Voltage,type="l", xlab="datetime", ylab="Voltage")
plot(mydataset$DateTime,mydataset$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(mydataset$DateTime,mydataset$Sub_metering_2,type="l",col="red")
lines(mydataset$DateTime,mydataset$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(mydataset$DateTime,mydataset$Global_reactive_power,type="l", 
     xlab="datetime", ylab="Global_reactive_power")

#Close off device
dev.off()
