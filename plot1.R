# Read data for '1/2/2007' and '2/2/2007' only
power <- read.table('./household_power_consumption.txt', sep=";", skip=66637, nrow=2880)


# Keep the original column names
power_headers <- read.table('./household_power_consumption.txt', sep=";", header=TRUE, nrow=1)
colnames(power) <- colnames(power_headers)


# Plot histogram of Global_active_power to screen
hist(power$Global_active_power, col='red', 
     xlab='Global Active Power (kilowatts)', main='Global Active Power')


# Copy the plot to a png device with specified size
dev.copy(png, file="./plot1.png", width=480, height=480, unit="px")
# Close plot device
dev.off()



