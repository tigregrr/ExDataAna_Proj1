require(data.table)
require(zoo)

wd <- getwd()
path <- file.path(wd, "/data/household_power_consumption.txt", fsep="")
hpc <- suppressWarnings(fread(path, header=T, na.strings="?", sep=";"))
hpc = hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

#plot.1
p1 = zoo(ts(as.numeric(hpc$Global_active_power), start=c(1), frequency=1440))

#plot.2
p2 = zoo(ts(as.numeric(hpc$Voltage), start=c(1), frequency=1440))

#plot.3
sm_1 = zoo(ts(as.numeric(hpc$Sub_metering_1), start=c(1), frequency=1440))
sm_2 = zoo(ts(as.numeric(hpc$Sub_metering_2), start=c(1), frequency=1440))
sm_3 = zoo(ts(as.numeric(hpc$Sub_metering_3), start=c(1), frequency=1440))

#plot.4
p4 = zoo(ts(as.numeric(hpc$Global_reactive_power), start=c(1), frequency=1440))

#combining plots into one overall graph
png("plot4.png", width=480, height=480, bg="white")
par(mfrow=c(2,2))
plot.zoo(p1, 
         ylab=paste("Global Active Power"), 
         xlab="")
plot.zoo(p2,
         ylab=paste("Voltage"),
         xlab="datetime")
plot.zoo(cbind(sm_1,sm_2,sm_3),
         plot.type="single",
         col=c("black", "red","blue"),
         ylab=paste("Energy sub metering"),
         xlab="")
plot.zoo(p4, 
         ylab=paste("Global_reactive_power"),
         xlab="datetime")
dev.off()