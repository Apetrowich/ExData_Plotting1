datafull <- read.csv("household_power_consumption.txt", header = TRUE,
                     sep = ";", na.strings = "?", nrows = 2075259,
                     check.names = FALSE, stringsAsFactors = FALSE,
                     comment.char = " ", quote = '\"')
##Subset Data
datasub <- subset(datafull, Date %in% c("1/2/2007", "2/2/2007"))
datasub$Date <- as.Date(datasub$Date, format = "%d/%m/%Y")
##Create Histogram
hist(datasub$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
##Copy to png format
dev.copy(png, file = "plot1.png")
dev.off()
