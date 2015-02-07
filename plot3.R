plot3 <- function(){
  hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  hpc <- subset(hpc, hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02', select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
  hpc$Time <- paste(hpc$Date, hpc$Time)
  hpc$Time <- strptime(hpc$Time, "%Y-%m-%d %H:%M:%S")
  plot(hpc$Time, hpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col = 'black')
  lines(hpc$Time, hpc$Sub_metering_2, type="l", col = 'red')
  lines(hpc$Time, hpc$Sub_metering_3, type="l", col = 'blue')
  legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch='-', col = c('black', 'red', 'blue'), lwd=2)
  dev.copy(png, width = 480, height = 480, 'plot3.png')
  dev.off()
}