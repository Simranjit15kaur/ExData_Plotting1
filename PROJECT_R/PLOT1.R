# Load the dataset
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time columns to Date/Time class
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter data for the dates 2007-02-01 and 2007-02-02
data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Remove rows with missing data for Global Active Power
data_filtered <- na.omit(data_filtered)

# Create a histogram of Global Active Power
png("plot1.png", width=480, height=480)
hist(data_filtered$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", breaks=30, border="white")
dev.off()

