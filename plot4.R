## Coursera 4th Course Data Plotting Project
## George Dai
##
# read in data
dataset <- read.table('household_power_consumption.txt', header=TRUE, 
                      na.strings = '?', sep=';')
dataset$Date <- as.Date(dataset$Date, format = '%d/%m/%Y')
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), '%Y-%m-%d %H:%M:%S')

# get a subset from 2007-02-01 to 2007-02-02
smallset <- subset(dataset, Date >= as.Date('2007-02-01') & 
                           Date <= as.Date('2007-02-02'))

# Plot 4
png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2), mar = c(4, 4, 1, 1))
with(smallset, plot(Time, Global_active_power, type = 'l',
                    xlab = '', cex.lab = 0.8,
                    cex.axis = 0.8, ylab = 'Global Active Power'))
with(smallset, plot(Time, Voltage, type = 'l',
                    xlab = 'datetime', cex.lab = 0.8,
                    cex.axis = 0.8, ylab = 'Voltage'))
with(smallset, plot(Time, Sub_metering_1, type = 'l', col = 'black',
                    xlab = '', cex.lab = 0.8, 
                    ylab = 'Energy sub metering', cex.axis = 0.8))
with(smallset, lines(Time, Sub_metering_2, type = 'l', col = 'red'))
with(smallset, lines(Time, Sub_metering_3, type = 'l', col = 'blue'))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.75)
with(smallset, plot(Time, Global_reactive_power, type='l',
                    cex.lab = 0.8, cex.axis = 0.8))

# close device
dev.off()


