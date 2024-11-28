# Load the dataset
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time columns to Date/Time class
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter data for the dates 2007-02-01 and 2007-02-02
data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Remove rows with missing data for Global Reactive Power
data_filtered <- na.omit(data_filtered)

# Time Series Plot of Global Reactive Power
png("plot4.png", width=480, height=480)
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, type="l", col="black", 
     xlab="Datetime", ylab="Global Reactive Power", main="Global Reactive Power over Time")
dev.off()
