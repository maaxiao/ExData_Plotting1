# Read data for '1/2/2007' and '2/2/2007' only
power <- read.table('./household_power_consumption.txt', sep=";", skip=66637, nrow=2880)


# Keep the original column names
power_headers <- read.table('./household_power_consumption.txt', sep=";", header=TRUE, nrow=1)
colnames(power) <- colnames(power_headers)


# Combine first column 'Date' with second column "Time'
DateTime <- paste(power$Date, power$Time)
# Convert 'Date Time' character to DateTime class.
DT <- strptime(DateTime, "%d/%m/%Y %H:%M:%S") 


# Plot time-dependence of Global_active_power as solid line
plot(DT, power$Global_active_power, type='l', 
     xlab='datetime', ylab='Global Active Power (kilowatts)')


# Copy the plot to a png device with specified size
dev.copy(png, file="./plot2.png", width=480, height=480, unit="px")
# Close plot device
dev.off()



