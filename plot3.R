data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data2days <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data2days <- cbind(data2days, "DateTime" = as.POSIXct(paste(data2days$Date, data2days$Time), 
                                                      format="%d/%m/%Y %H:%M:%S"))

plot(data2days$Sub_metering_1 ~ data2days$DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(data2days$Sub_metering_2 ~ data2days$DateTime, type="l", col="red")
lines(data2days$Sub_metering_3 ~ data2days$DateTime, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
