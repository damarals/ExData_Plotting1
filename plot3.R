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
data <- read.table('household_power_consumption.txt', 
                   header = T, sep = ';',stringsAsFactors = F)
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

# Delete data file .txt
if(file.exists('./household_power_consumption.txt')) {
  invisible(file.remove('./household_power_consumption.txt'))
}

# Create the png
png('./plot3.png') # default is 480px X 480px

# Make Plot 3
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
                  col=c("black", "red", "blue"), lty = 1))

# Close png file
dev.off()



