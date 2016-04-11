power_consumption <- read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?", stringsAsFactors = F)
power_consumption <- power_consumption[(power_consumption$Date == "2/1/2007") | (power_consumption$Date == "2/2/2007"),]

png(filename="plot1.png",width=480, height=480, bg="white")
hist(
  power_consumption$Global_active_power,
  col="red",
  ylim = c(0, 1200),
  xlim = c(0, 6),
  breaks = 12,
  xlab="Global Active Power (kilowatts)",
  main="Global Active Power"
  )
dev.off()