plot1 <- function(){
  hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  hpc <- subset(hpc, hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02')
  gp <- hpc$Global_active_power
  gp <- as.numeric(as.character(gp))
  hist(gp, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, width = 480, height = 480, 'plot1.png')
  dev.off()
}