#!/opt/local/bin/Rscript

# Original code by Rick Osborne
# library(chron)
source("get_power_data.R")

OUT_FILE <- "plot1.png"

library(data.table)

all_data <- fread(DATA_FILE, sep=";", na.strings="?")
relevant <- all_data[Date=="1/2/2007"|Date=="2/2/2007"]
all_data <- NULL
# relevant[,DateTime:=chron(Date,Time, format=c(dates="d/m/Y",times="h:m:s"))]
relevant[,GAP:=as.numeric(Global_active_power)]

png(filename=OUT_FILE, width=480, height=480, units="px")

with(relevant, hist(GAP, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))

dev.off()
