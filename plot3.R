setwd('/Users/vega/Desktop/MSophtho/coursera R/exploratory')
p1df <- read.table('household_power_consumption.txt', sep=';', skip=66637, nrows = 2880) 
header <- read.table('household_power_consumption.txt', nrows = 1, sep =';')
colnames(p1df) <- unlist(header)

time <- with(p1df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T"))
min <- as.POSIXct(min(time)); max <- as.POSIXct(max(time)); med <- as.POSIXct(median(time))

plot(time, p1df[,7], type='l', xaxt='n', xlab='', ylab="Energy sub metering")
lines(time, p1df[,8], type='l', col=c('red'))
lines(time, p1df[,9], type='l', col=c('blue'))
axis(1, at=c(min, med, max), labels=c('Thu', 'Fri', 'Sat'))
legend('topright', lty=c(1,1), legend=names(p1df[,7:9]), col=c('black', 'red', 'blue'))


