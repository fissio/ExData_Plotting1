plot2 <- function(){
  hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  hpc <- subset(hpc, hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02', select = c(Date, Time, Global_active_power))
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  hpc$Time <- paste(hpc$Date, hpc$Time)
  hpc$Time <- strptime(hpc$Time, "%Y-%m-%d %H:%M:%S")
  plot(hpc$Time, hpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png, width = 480, height = 480, 'plot2.png')
  dev.off()
}