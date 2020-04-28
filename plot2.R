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

# plot 2
library('ggplot2')
png('plot2.png', width = 480, height = 480)
with(smallset, plot(Time, Global_active_power, type = 'l',
                    xlab = '',
                    ylab = 'Global Active Power (killowatts)'))

# close device
dev.off()
