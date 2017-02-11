setwd('/Users/vega/Desktop/MSophtho/coursera R/exploratory')
p1df <- read.table('household_power_consumption.txt', sep=';', skip=66637, nrows = 2880) 
header <- read.table('household_power_consumption.txt', nrows = 1, sep =';')
colnames(p1df) <- unlist(header)

hist(p1df$Global_active_power, col='red', main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
