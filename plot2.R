# Load libraries
library(data.table)
library(lubridate)

# Load data
data <- fread("./data/household_power_consumption.txt")
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
rm(data)
data_subset$DateTime <- dmy_hms(paste(data_subset$Date, data_subset$Time))

# Plot
with(data_subset, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Create a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
rm(data_subset)