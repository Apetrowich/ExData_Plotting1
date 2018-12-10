##Read data
datafull <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##Create subset
datasub <- subset(datafull, Date %in% c("1/2/2007","2/2/2007"))
datasub$Date <- as.Date(datasub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)
##Create plot
with(datasub, {
      plot(Sub_metering_1~Datetime, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
      lines(Sub_metering_2~Datetime,col='red')
      lines(Sub_metering_3~Datetime,col='blue')
})
##Create legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Copy to png format
dev.copy(png, file = "plot3.png")
dev.off()
