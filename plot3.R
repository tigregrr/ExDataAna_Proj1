require(data.table)
require(zoo)

wd <- getwd()
path <- file.path(wd, "/data/household_power_consumption.txt", fsep="")
hpc <- suppressWarnings(fread(path, header=T, na.strings="?", sep=";"))
hpc = hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

sm_1 = zoo(ts(as.numeric(hpc$Sub_metering_1), start=c(1), frequency=1440))
sm_2 = zoo(ts(as.numeric(hpc$Sub_metering_2), start=c(1), frequency=1440))
sm_3 = zoo(ts(as.numeric(hpc$Sub_metering_3), start=c(1), frequency=1440))

png("plot3.png", width=480, height=480, bg="white")
plot.zoo(cbind(sm_1,sm_2,sm_3),
         plot.type="single",
         col=c("black", "red","blue"),
         ylab=paste("Energy sub metering"),
         xlab="")
dev.off()