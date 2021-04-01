# Load libraries
library(data.table)
library(lubridate)
library(dplyr)
# Read the data
household <- fread("household_power_consumption.txt", sep = ";")
# Trim down the set to where Date is equal to 1/2/2007 or 2/2/2007
household <- subset(household, Date=='1/2/2007' | Date=='2/2/2007')
# Convert Date and Time as a POSIXct/POSIXt type and assign to new variables
date <- dmy(household$Date)
dateTime <- dmy_hms(paste(household$Date, household$Time))
# Initialize graphics device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
# Set margins of graphics device
par(mar=c(2,4,1,1))
# Create a scatterplot for the Global Active Power without the dots
plot(dateTime, household$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
# Annotate the plot with the following:
lines(dateTime, household$Sub_metering_1)
lines(dateTime, household$Sub_metering_2, col="red")
lines(dateTime, household$Sub_metering_3, col="blue")
# Annotate legends
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Export as png
dev.off()
