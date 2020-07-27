library(lubridate)

# download & unzip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

# load relevant rows
hpc <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
headers <- read.table("household_power_consumption.txt", nrows=1, sep=";")
names(hpc) <- headers

#create a datetime variable
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- dmy_hms(hpc$DateTime)

#create the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
plot(hpc$DateTime, hpc$Voltage, 
     type="l",
     ylab="Voltage",
     xlab="datetime")
plot(hpc$DateTime, hpc$Sub_metering_1, 
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",
       col=c("black", "red", "blue"), lty = 1)
plot(hpc$DateTime, hpc$Global_reactive_power, 
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")
dev.off()