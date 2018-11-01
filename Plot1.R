#Read data from txt file 
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Read right dates
mydataset <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007",]

#Opening PNG Device
png(filename="plot1.png", width=480, height=480)

#Creating histogram
hist(mydataset$Global_active_power,main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",col="red")

#Close off device
dev.off()