# Load libraries
library(data.table)
library(lubridate)

# Load data
data <- fread("./data/household_power_consumption.txt")
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
rm(data)
data_subset$DateTime <- dmy_hms(paste(data_subset$Date, data_subset$Time))

# Plot
with(data_subset, plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(data_subset, lines(DateTime, Sub_metering_2, col = "red"))
with(data_subset, lines(DateTime, Sub_metering_3, col = "blue"))     
legend("topright", lty = "solid",  col = c("black", "red", "blue"), legend = c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "))

# Create a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
rm(data_subset)