#Read data from txt file 
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Read right dates
mydataset <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007",]

## put date & time together and creat a day/time format 
mydataset$DateTime <- strptime(paste(mydataset$Date, mydataset$Time), "%d/%m/%Y %H:%M:%S")

#Opening PNG Device
png(filename="plot2.png", width=480, height=480)

#Create plot
plot(mydataset$DateTime,mydataset$Global_active_power,type="l", xlab="",
      ylab="Global Active Power (kilowatts)")

#Close off device
dev.off()