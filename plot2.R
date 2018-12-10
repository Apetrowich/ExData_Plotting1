datafull <- read.csv("household_power_consumption.txt", header = TRUE,
                     sep = ";", na.strings = "?", nrows = 2075259,
                     check.names = FALSE, stringsAsFactors = FALSE,
                     comment.char = " ", quote = '\"')
##Subset Data
datasub <- subset(datafull, Date %in% c("1/2/2007", "2/2/2007"))
datasub$Date <- as.Date(datasub$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)
##Create plot
with(datasub, {
      plot(Global_active_power~Datetime, type = "l",
      ylab = "Global Active Power (kilowatts)", xlab = "")
})
##Copy to png format
dev.copy(png, file = "plot1.png")
dev.off()
