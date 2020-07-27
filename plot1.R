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
png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, 
     main="Global Active Power", 
     col="red", 
     xlab="Global Active Power (kilowatts)")
dev.off()