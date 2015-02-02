library(dplyr)

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?",header=TRUE)

household_power_consumption <- transform(household_power_consumption, Date = as.Date(Date,"%d/%m/%Y"))
household_power_consumption <-(filter(household_power_consumption, Date=="2007-02-01"|Date=="2007-02-02"))
household_power_consumption$DateTime <- with(household_power_consumption, strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"))

png(filename = "plot4.png")
par(mfrow = c(2,2))
with(household_power_consumption,plot(DateTime,Global_active_power,type="l",col="black",xlab="",main="",ylab="Global Active Power"))

with(household_power_consumption, plot(DateTime,Voltage,type="l",col="black",xlab="datetime",ylab="Voltage",main=""))

with(household_power_consumption,plot(DateTime,Sub_metering_1,type="l",col="black",xlab="",main="",ylab="Energy sub metering"))
with(household_power_consumption,lines(DateTime,Sub_metering_2,col="red"))
with(household_power_consumption,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

with(household_power_consumption, plot(DateTime,Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power",main=""))
dev.off()
