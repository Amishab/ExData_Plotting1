pwr <- read.table ("household_power_consumption.txt", 
                   header = T, 
                   sep = ';',
                   na.strings = "?",
                   stringsAsFactors = F, quote = '\"' )

pwr$Time<- paste(pwr$Date, pwr$Time)

pwr$Time <- strptime(pwr$Time,"%d/%m/%Y %T")

pwr$Date <- as.Date(pwr$Date, "%d/%m/%Y")

pwr<- pwr[pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02", ] 


png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

hist(pwr$Global_active_power, col = "red", 
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

     mtext ("Plot 1", side = 3, line = 3, adj=0)

#dev.copy(png,"plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white" )

dev.off()
