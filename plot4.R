setwd('/Users/vega/Desktop/MSophtho/coursera R/exploratory')
p1df <- read.table('household_power_consumption.txt', sep=';', skip=66637, nrows = 2880) 
header <- read.table('household_power_consumption.txt', nrows = 1, sep =';')
colnames(p1df) <- unlist(header)

datetime <- with(p1df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T"))
min <- as.POSIXct(min(datetime)); max <- as.POSIXct(max(datetime)); med <- as.POSIXct(median(datetime))

par(mfcol=c(2,2))
plot(datetime, p1df$Global_active_power, type='l', xaxt='n', xlab='', ylab="Global Active Power (kilowatts)")
axis(1, at=c(min, med, max), labels=c('Thu', 'Fri', 'Sat'))

plot(datetime, p1df[,7], type='l', xaxt='n', xlab='', ylab="Energy sub metering")
lines(datetime, p1df[,8], type='l', col=c('red'))
lines(datetime, p1df[,9], type='l', col=c('blue'))
axis(1, at=c(min, med, max), labels=c('Thu', 'Fri', 'Sat'))
legend('topright', lty=c(1,1), bty='n', legend=names(p1df[,7:9]), col=c('black', 'red', 'blue'))

plot(datetime, p1df$Voltage, type='l', xaxt='n', ylab="Voltage")
axis(1, at=c(min, med, max), labels=c('Thu', 'Fri', 'Sat'))

with(p1df, plot(datetime, Global_reactive_power, type='l', xaxt='n'))
axis(1, at=c(min, med, max), labels=c('Thu', 'Fri', 'Sat'))
