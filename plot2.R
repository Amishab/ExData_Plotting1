pwr <- read.table ("household_power_consumption.txt", 
                   header = T, 
                   sep = ';',
                   na.strings = "?",
                   stringsAsFactors = F, quote = '\"' )

pwr$Time<- paste(pwr$Date, pwr$Time)

pwr$Time <- strptime(pwr$Time,"%d/%m/%Y %T")

pwr$Date <- as.Date(pwr$Date, "%d/%m/%Y")

pwr<- pwr[pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02", ] 

#pwr$Wday <- weekdays(pwr$Time, abbreviate = T)

pwr$Datetime <- as.POSIXct(pwr$Time)

png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")



plot(pwr$Global_active_power ~ pwr$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")


mtext ("Plot 2", side = 3, line = 3, adj=0)



dev.off()
