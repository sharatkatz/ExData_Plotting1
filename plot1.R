
# Read in the data
hpc <- read.table("./household_power_consumption.txt",header = T, sep = ";",na.strings = c("?"), stringsAsFactors = F)
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset data and clean up space
hpc_req <- subset(hpc, (Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")))
rm(hpc); gc()

# PNG file device and histogram
png("./plot1.png", width = 480, height = 480, units="px")
hist(hpc_req$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# shut down specified device
dev.off()
