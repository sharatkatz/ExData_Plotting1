
# Read in the data
hpc <- read.table("./household_power_consumption.txt",header = T, sep = ";",na.strings = c("?"), stringsAsFactors = F)
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset data and clean up space
hpc_req <- subset(hpc, (Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")))
rm(hpc); gc()

# PNG file device and line plot
png("./plot3.png", width = 480, height = 480, units="px")

with(hpc_req, {
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, type="l",col="red")
  lines(datetime, Sub_metering_3, type="l",col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))
})

# shut down specified device
dev.off()
