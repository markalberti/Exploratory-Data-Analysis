setwd("C:/Documents and Settings/malb0038/Dokumenter/Dropbox/MOOC/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

#test add date and time
data$DateTime <- paste(as.character(data$Date), as.character(data$Time), sep = " ")
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
# below works
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# above is common to all four plots
par(mfrow = c(2,2))
#plot 1
plot(data$DateTime, data$Global_active_power, xlab= " ", 
     ylab = "Global Active Power (kilowatts)", type="l")
lines(data$DateTime, data$Global_active_power)
#plot2
plot(data$DateTime, data$Voltage, xlab = "datetime",
     ylab = "Voltage", type="l")
# plot bottom left
with(data, plot(DateTime, Sub_metering_1, type = "n",
                ylab = "Energy sub metering", xlab = " "))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend('topright', pch = "_", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# bottom right plot
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "n")
lines(data$DateTime, data$Global_reactive_power)
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()