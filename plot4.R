# Load libraries
library(data.table)
library(lubridate)

# Load data
data <- fread("./data/household_power_consumption.txt")
rm(data)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data_subset$DateTime <- dmy_hms(paste(data_subset$Date, data_subset$Time))

# Plot
par(mfrow = c(2, 2))
with(data_subset, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")     
  legend("topright", bty = "n", lty = "solid",  col = c("black", "red", "blue"), cex = 0.7, legend = c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "))
  
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# Create a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
rm(data_subset)