ds<-read.csv("household_power_consumption.txt", sep=";")
ds<-ds[ds$Date=="1/2/2007"|ds$Date=="2/22007",]
ds$Date<-as.Date(ds$Date, "%d/%m/%Y")
ds$Global_active_power<-as.numeric(ds$Global_active_power)
hist(ds$Global_active_power, breaks=12, 
     xlab="Global active power (kilowatts)", main="Global active power", col="red")