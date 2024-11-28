# Load the dataset
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time columns to Date/Time class
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter data for the dates 2007-02-01 and 2007-02-02
data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Remove rows with missing data for Global Active Power
data_filtered <- na.omit(data_filtered)

# Plot Energy Sub Metering
png("plot3.png", width=480, height=480)
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy Sub Metering", main="Energy Sub Metering")
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
