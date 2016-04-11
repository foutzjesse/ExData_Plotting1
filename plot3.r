power_consumption <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?", stringsAsFactors = F)
power_consumption <- power_consumption[(power_consumption$Date == "2/1/2007") | (power_consumption$Date == "2/2/2007"),]

power_consumption$datetime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep= " "), format="%m/%d/%Y %H:%M:%S")

png(filename="plot3.png",width=480, height=480, bg="white")
plot(
  power_consumption$datetime, 
  power_consumption$Sub_metering_1, 
  type="n", 
  xlab="",
  ylim=c(0, 30),
  ylab="Energy sub metering"
  )
lines(
  power_consumption$datetime, 
  power_consumption$Sub_metering_1, 
  col="black"
)
lines(
  power_consumption$datetime, 
  power_consumption$Sub_metering_2, 
  col="red"
)
lines(
  power_consumption$datetime, 
  power_consumption$Sub_metering_3, 
  col="blue"
)
legend(
  "topright",
  bty="n",
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col=c("black", "red", "blue"),
  lty="solid"
)
dev.off()