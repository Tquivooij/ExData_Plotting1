#######################
# 
# Course Explanatory Data Analysis
# Assignment ExData Plotting 1
# Plot 2
# Tim Quivooij
#
########################

# check working directory
getwd()
par(mfrow = c(1,1)) # one row, one column
HouseholdData <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
# head(HouseholdData)
# str(HouseholdData)

# change to date format and time format
# ?as.Date
# ?strptime
# other columns to numeric
HouseholdData$Date <- as.Date(HouseholdData$Date, "%d/%m/%Y")
HouseholdData$Global_active_power <- as.numeric(HouseholdData$Global_active_power)
HouseholdData$Global_reactive_power <- as.numeric(HouseholdData$Global_reactive_power)
HouseholdData$Voltage <- as.numeric(HouseholdData$Voltage)
HouseholdData$Global_intensity <- as.numeric(HouseholdData$Global_intensity)
HouseholdData$Sub_metering_1 <- as.numeric(HouseholdData$Sub_metering_1)
HouseholdData$Sub_metering_2 <- as.numeric(HouseholdData$Sub_metering_2)
HouseholdData$Sub_metering_3 <- as.numeric(HouseholdData$Sub_metering_3)

# combine date and time column
HouseholdData$DateTime <- paste(HouseholdData$Date, HouseholdData$Time)
HouseholdData$DateTime <- as.POSIXct(HouseholdData$DateTime)
HouseholdData$Time <- strptime(HouseholdData$Time, format="%H:%M:%S")


# subset from "2007-2-1" to "2007-2-2"
HouseholdData <- HouseholdData[HouseholdData$Date >= "2007-2-1"&
                                   HouseholdData$Date <= "2007-2-2",]


# Plot 2
with(HouseholdData, plot(DateTime, Global_active_power , type="l",
                         ylab="Global Active Power (kilowatts)", xlab="", xaxt="n"))
title(main="Global Active Power Vs Time")
axis(side = 1, at = c(as.numeric(HouseholdData$DateTime[1]),
                      as.numeric(HouseholdData$DateTime[1441]),
                      as.numeric(HouseholdData$DateTime[2880])), labels = c("Thu", "Fri", "Sat"))
dev.copy(device=png, width=480, height=480, file="Plot2.png")
dev.off() # close the PNG device
