#Read data from txt file 
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Read right dates
mydataset <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007",]

## put date & time together and creat a day/time format 
mydataset$DateTime <- strptime(paste(mydataset$Date, mydataset$Time), "%d/%m/%Y %H:%M:%S")

#Opening PNG Device
png(filename="plot3.png", width=480, height=480)

#Create plot and add lines and legend
plot(mydataset$DateTime,mydataset$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(mydataset$DateTime,mydataset$Sub_metering_2,type="l",col="red")
lines(mydataset$DateTime,mydataset$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Close off device
dev.off()