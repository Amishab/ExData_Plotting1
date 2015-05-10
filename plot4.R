pwr <- read.table ("household_power_consumption.txt", 
                   header = T, 
                   sep = ';',
                   na.strings = "?",
                   stringsAsFactors = F, quote = '\"' )

pwr$Time<- paste(pwr$Date, pwr$Time)

pwr$Time <- strptime(pwr$Time,"%d/%m/%Y %T")

pwr$Date <- as.Date(pwr$Date, "%d/%m/%Y")

pwr<- pwr[pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02", ] 


pwr$Datetime <- as.POSIXct(pwr$Time)

png("plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")



par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(pwr, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  mtext ("Plot 4", side = 3, line = 2, adj=0)
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})






dev.off()
