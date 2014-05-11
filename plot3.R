#!/opt/local/bin/Rscript

# Original code by Rick Osborne
library(chron)
library(data.table)
source("get_power_data.R")

OUT_FILE <- "plot3.png"

all_data <- fread(DATA_FILE, sep=";", na.strings="?")
relevant <- all_data[Date=="1/2/2007"|Date=="2/2/2007"]
all_data <- NULL
relevant[,DateTime:=chron(Date,Time, format=c(dates="d/m/Y",times="h:m:s"))]
# relevant[,GAP:=as.numeric(Global_active_power)]
relevant[,SM1:=as.numeric(Sub_metering_1)]
relevant[,SM2:=as.numeric(Sub_metering_2)]
relevant[,SM3:=as.numeric(Sub_metering_3)]

png(filename=OUT_FILE, width=480, height=480, units="px")

par(mar=c(2,4,1,2))
with(relevant, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", xaxt="n"))
axis.Date(1, at=relevant$DateTime, format="%a")
with(relevant, lines(DateTime, SM1, type="l", col="black"))
with(relevant, lines(DateTime, SM2, type="l", col="red"))
with(relevant, lines(DateTime, SM3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), pch="_")

dev.off()
