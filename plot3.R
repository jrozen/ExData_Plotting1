## The household_power_consumption.txt should be in the working directory
ds <- read.csv("household_power_consumption.txt", sep=";", 
               colClasses = c("character", 
                              "character", 
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric", 
                              "numeric",
                              "numeric"),
               na.strings="?")

## Since the dataset is large, filter the Date vector as string
dsf<-ds[ds$Date=="1/2/2007"|ds$Date=="2/2/2007",]
rm(ds)

## Create a date time column
dsf$DateTime <- as.POSIXct(paste(dsf$Date, dsf$Time), format="%d/%m/%Y %H:%M:%S")

## Create a png device and plot a line diagram over multiple submetering
## Due to swedish locale the abbr for weekdays are in swedish
plot.new()

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")

plot(dsf$DateTime, dsf$Sub_metering_1, type="l", xlab=NA,
     ylab="Energy sub metering")
points(dsf$DateTime, dsf$Sub_metering_2, type="l", col="red")
points(dsf$DateTime, dsf$Sub_metering_3, type="l", col="blue")

legend("topright", names(dsf)[7:9],col=c("black", "red", "blue"), lty=1)

dev.off()