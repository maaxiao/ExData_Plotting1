# Read data for '1/2/2007' and '2/2/2007' only
power <- read.table('./household_power_consumption.txt', sep=";", skip=66637, nrow=2880)
# Keep the original column names
power_headers <- read.table('./household_power_consumption.txt', sep=";", header=TRUE, nrow=1)
colnames(power) <- colnames(power_headers)



# Combine first column 'Date' with second column "Time'
DateTime <- paste(power$Date, power$Time)
# Convert 'Date Time' character to DateTime class.
DT <- strptime(DateTime, "%d/%m/%Y %H:%M:%S") 



# Create 2x2 subplots
par(mfrow = c(2, 2))

# Subplot1: time-dependence of Global_active_power
plot(DT, power$Global_active_power, type='l', cex.lab = 0.8, cex.axis =0.8,
     xlab='datetime', ylab='Global Active Power')

# Subplot2: time-dependence of Voltage
plot(DT, power$Voltage, type='l', cex.lab = 0.8, cex.axis =0.8,
     xlab='datetime', ylab='Voltage')

# Subplot3: time-dependence of 3 Sub_Metering readings
plot(DT, power$Sub_metering_1, type='l', col='black', cex.lab = 0.8, cex.axis =0.8,
     xlab='datetime', ylab='Energy sub metering')
lines(DT, power$Sub_metering_2, col='red') 
lines(DT, power$Sub_metering_3, col='blue') 
legend("topright", bty='n', lty = 1, cex = 0.75,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# Subplot4: time-dependence of Global_active_power
plot(DT, power$Global_reactive_power, type='l', cex.lab = 0.8, cex.axis =0.8,
     xlab='datetime', ylab='Global Reactive Power')



# Copy the plot to a png device with specified size
dev.copy(png, file="./plot4.png", width=480, height=480, unit="px")
# Close plot device
dev.off()
