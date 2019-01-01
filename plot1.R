data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data2days <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data2days <- cbind(data2days, "DateTime" = as.POSIXct(paste(data2days$Date, data2days$Time), 
                                                      format="%d/%m/%Y %H:%M:%S"))
hist(data2days$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", breaks=13)

library(datasets)
dev.copy(png, file="plot1.png")
dev.off()

