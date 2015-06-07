setwd("~/Downloads")
if(!file.exists("./DataScience")){dir.create("./DataScience")}
setwd("./DataScience")
library(dplyr)
library(lubridate)
# load data from Electric Power, filter for 2007-02-01 and 2007-02-02 on load
feb07pwr <- filter(read.table("/Users/cdentremontparte/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character"), Date == "2/2/2007" | Date == "1/2/2007")
# convert Date and Time variables to Date/Time classes - added a column instead
febPwr <- cbind(feb07pwr, newDate = dmy_hms(paste(feb07pwr$Date, feb07pwr$Time)))
# create plot3 - lines for sub_metering by date/time 
par(mfrow = c(1,1))
plot(febPwr$newDate, febPwr$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub-metering")
lines(febPwr$newDate, febPwr$Sub_metering_1)
lines(febPwr$newDate, febPwr$Sub_metering_2, col = "red")
lines(febPwr$newDate, febPwr$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), col = c("black", "red", "blue"))
## Copy  to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px") 
dev.off()