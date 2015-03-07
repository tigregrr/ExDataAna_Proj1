require(data.table)
require(lubridate)
require(stats)

wd <- getwd()
path <- file.path(wd, "/data/household_power_consumption.txt", fsep="")
hpc <- suppressWarnings(fread(path, header=T, na.strings="?", sep=";"))
hpc.ss = hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

png("plot1.png", width=480, height=480, bg="white")
hist(as.numeric(hpc.ss$Global_active_power),
     col="red", 
     labels=F,
     xlab=paste("Global Active Power(kilowatts)"),
     main=paste("Global Activite Power"))
dev.off()