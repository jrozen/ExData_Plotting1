## The household_power_consumption.txt should be in the working direcory
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

## Create a png device and plot a histogram over global active power
## Due to swedish locale the abbr for weekdays are in swedish
plot.new()
## The household_power_consumption.txt should be in the working direcory
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

## Create a png device and plot a histogram over global active power
## Due to swedish locale the abbr for weekdays are in swedish
plot.new()

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg="transparent")

par(mfrow=c(2,2))

## plot 1
plot(dsf$DateTime, dsf$Global_active_power, type="l", xlab=NA,
     ylab="Global active power")

## plot 2
plot(dsf$DateTime, dsf$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

## plot 3
plot(dsf$DateTime, dsf$Sub_metering_1, type="l", xlab=NA,
     ylab="Energy sub metering")
points(dsf$DateTime, dsf$Sub_metering_2, type="l", col="red")
points(dsf$DateTime, dsf$Sub_metering_3, type="l", col="blue")

legend("topright", names(dsf)[7:9],col=c("black", "red", "blue"), lty=1)

## plot 4
plot(dsf$DateTime, dsf$Global_reactive_power, type="l",
    xlab="datetime", ylab="Global_reactive_power")

## close file device
dev.off()
