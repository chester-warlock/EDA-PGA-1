# Load libraries
library(data.table)
# Read the data
household <- fread("household_power_consumption.txt", sep = ";")
# Trim down the set to where Date is equal to 1/2/2007 or 2/2/2007
household <- subset(household, Date=='1/2/2007' | Date=='2/2/2007')
# Initialize graphics device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# Set margins of graphics device
par(mar=c(4,4,1,0))
# Create a histogram for the Global Active Power
hist(as.numeric(household$Global_active_power), 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "red")
# Export as png
dev.off()
