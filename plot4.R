# libraries
require(utils)
require(lubridate)

# download, load data and subset
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, 
              destfile = './Eletric_data.zip', 
              method = 'curl', quiet = T)
if(file.exists('./Eletric_data.zip')) {
  # Extract data file
  unzip('./Eletric_data.zip')
  # Delete original Zip file if it exists
  invisible(file.remove('./Eletric_data.zip'))
}
data <- read.table('household_power_consumption.txt', header = T, sep = ';')
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

# Delete data file .txt
if(file.exists('./household_power_consumption.txt')) {
  invisible(file.remove('./household_power_consumption.txt'))
}


# Create the png
png('./plot4.png') # default is 480px X 480px

# Split graphic device
par(mfrow = c(2,2))

# Make Plot 4.1
with(data, plot(dmy(Date) + hms(Time), as.numeric(Global_active_power), 
                xlab = '', type = 'l',
                ylab = 'Global Active Power'))

# Make Plot 4.2
with(data, plot(dmy(Date) + hms(Time), as.numeric(Voltage), 
                xlab = 'datetime', type = 'l',
                ylab = 'Voltage'))

# Make Plot 4.3
with(data, plot(dmy(Date) + hms(Time), as.numeric(Sub_metering_1), 
                xlab = '', type = 'l',
                ylab = 'Energy sub metering'))
with(data, lines(dmy(Date) + hms(Time), as.numeric(Sub_metering_2),
                 col = 'red'))
with(data, lines(dmy(Date) + hms(Time), as.numeric(Sub_metering_3),
                 col = 'blue'))
with(data, legend('topright', legend=c("Sub_metering_1", 
                                       "Sub_metering_2",
                                       "Sub_metering_3"),
                  col=c("black", "red", "blue"), lty = 1, 
                  box.lty=0, inset = .01))

# Make Plot 4.4
with(data, plot(dmy(Date) + hms(Time), as.numeric(Global_reactive_power), 
                xlab = 'datetime', type = 'l', lwd = 1.2,
                ylab = 'Global_reactive_power'))

# Close png file
dev.off()

