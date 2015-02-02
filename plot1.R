library(dplyr)

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?",header=TRUE)

household_power_consumption <- transform(household_power_consumption, Date = as.Date(Date,"%d/%m/%Y"))
household_power_consumption <-(filter(household_power_consumption, Date=="2007-02-01"|Date=="2007-02-02"))

png(filename = "plot1.png")
hist(household_power_consumption$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Gloabl Active Power")
dev.off()
