# Read data for '1/2/2007' and '2/2/2007' only
power <- read.table('./household_power_consumption.txt', sep=";", skip=66637, nrow=2880)


# Keep the original column names
power_headers <- read.table('./household_power_consumption.txt', sep=";", header=TRUE, nrow=1)
colnames(power) <- colnames(power_headers)


# Combine first column 'Date' with second column "Time'
DateTime <- paste(power$Date, power$Time)
# Convert 'Date Time' character to DateTime class.
DT <- strptime(DateTime, "%d/%m/%Y %H:%M:%S") 


# Plot time-dependence of Sub_Metering_1 as solid line
plot(DT, power$Sub_metering_1, type='l', col='black',
     xlab='datetime', ylab='Energy sub metering')
# Add a line of Sub_Metering_2 vs datetime
lines(DT, power$Sub_metering_2, col='red') 
# Add a line of Sub_Metering_3 vs datetime
lines(DT, power$Sub_metering_3, col='blue') 
# Add legends for 3 curves
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Copy the plot to a png device with specified size
dev.copy(png, file="./plot3.png", width=480, height=480, unit="px")
# Close plot device
dev.off()



