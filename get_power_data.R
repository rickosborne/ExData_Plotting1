DATA_DIR <- "data"
DATA_FILE <- file.path(DATA_DIR, "household_power_consumption.txt")
SOURCE_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
ZIP_FILE <- file.path(DATA_DIR, "household_power_consumption.zip")

dir.create(DATA_DIR, showWarnings=FALSE)
if (!file.exists(DATA_FILE)) {
  if (!file.exists(ZIP_FILE)) {
    download.file(SOURCE_URL, destfile=ZIP_FILE, method="curl")
  }
  unzip(ZIP_FILE, exdir=DATA_DIR)
}
