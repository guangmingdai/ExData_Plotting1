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

# Plot 3
png('plot3.png', width = 480, height = 480)
with(smallset, plot(Time, Sub_metering_1, type = 'l', col = 'black',
                    xlab = '',
                    ylab = 'Energy sub metering'))
with(smallset, lines(Time, Sub_metering_2, type = 'l', col = 'red'))
with(smallset, lines(Time, Sub_metering_3, type = 'l', col = 'blue'))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close device
dev.off()
