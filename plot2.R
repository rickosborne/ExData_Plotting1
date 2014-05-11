#!/opt/local/bin/Rscript

# Original code by Rick Osborne
library(chron)
library(data.table)
source("get_power_data.R")

OUT_FILE <- "plot2.png"

all_data <- fread(DATA_FILE, sep=";", na.strings="?")
relevant <- all_data[Date=="1/2/2007"|Date=="2/2/2007"]
all_data <- NULL
relevant[,DateTime:=chron(Date,Time, format=c(dates="d/m/Y",times="h:m:s"))]
relevant[,GAP:=as.numeric(Global_active_power)]

png(filename=OUT_FILE, width=480, height=480, units="px")

par(mar=c(2,4,1,2))
with(relevant, plot(DateTime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n"))
axis.Date(1, at=relevant$DateTime, format="%a")

dev.off()
