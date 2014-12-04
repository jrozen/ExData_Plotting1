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

## Create a png device and plot a histogram over global active power
plot.new()
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg="transparent")
hist(dsf$Global_active_power, breaks=12, 
     xlab="Global active power (kilowatts)", main="Global active power", col="red")
dev.off()