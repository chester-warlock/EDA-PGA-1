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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# Set margins of graphics device
par(mar=c(2,4,1,1))
# Create a scatterplot for the Global Active Power without the dots
plot(dateTime, household$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatt)")
# Connect the dots
lines(dateTime, household$Global_active_power)
# Export as png
dev.off()
