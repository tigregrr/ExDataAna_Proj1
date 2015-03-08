require(data.table)

wd <- getwd()
path <- file.path(wd, "/data/household_power_consumption.txt", fsep="")
hpc <- suppressWarnings(fread(path, header=T, na.strings="?", sep=";"))
hpc = hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

hpc.ts = ts(as.numeric(hpc$Global_active_power), start=c(1), frequency=1440)

png("plot2.png", width=480, height=480, bg="white")
suppressWarnings(plot.ts(hpc.ts, backgroud="white"))
dev.off()
