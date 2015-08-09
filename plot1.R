# Load libraries
library(data.table)

# Load data
data <- fread("./data/household_power_consumption.txt")
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
rm(data)

# Plot
hist(as.numeric(data_subset$Global_active_power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

# Create a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
rm(data_subset)