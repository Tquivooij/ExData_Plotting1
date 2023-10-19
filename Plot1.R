#######################
# 
# Course Explanatory Data Analysis
# Assignment ExData Plotting 1
# Plot 1
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
HouseholdData$Time <- strptime(HouseholdData$Time, format="%H:%M:%S")
HouseholdData$Global_active_power <- as.numeric(HouseholdData$Global_active_power)
HouseholdData$Global_reactive_power <- as.numeric(HouseholdData$Global_reactive_power)
HouseholdData$Voltage <- as.numeric(HouseholdData$Voltage)
HouseholdData$Global_intensity <- as.numeric(HouseholdData$Global_intensity)
HouseholdData$Sub_metering_1 <- as.numeric(HouseholdData$Sub_metering_1)
HouseholdData$Sub_metering_2 <- as.numeric(HouseholdData$Sub_metering_2)
HouseholdData$Sub_metering_3 <- as.numeric(HouseholdData$Sub_metering_3)

# subset from "2007-2-1" to "2007-2-2"
HouseholdData <- HouseholdData[HouseholdData$Date >= "2007-2-1"&
                                   HouseholdData$Date <= "2007-2-2",]

# plot 1
hist(HouseholdData$Global_active_power, main="Global Active Power", 
     col="red", xlab="Global Active Power(kilowatts)")
# save copy to a PNG file
dev.copy(device=png, width=480, height=480, file="Plot1.png")
dev.off() # close the PNG device
