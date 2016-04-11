power_consumption <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?", stringsAsFactors = F)
power_consumption <- power_consumption[(power_consumption$Date == "2/1/2007") | (power_consumption$Date == "2/2/2007"),]

power_consumption$datetime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep= " "), format="%m/%d/%Y %H:%M:%S")

png(filename="plot2.png",width=480, height=480, bg="white")
plot(power_consumption$datetime, 
     power_consumption$Global_active_power, 
     type="l", 
     xlab="",
     ylim = c(0, 6),
     ylab="Global Active Power (kilowatts)")
dev.off()