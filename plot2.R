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
png('./plot2.png') # default is 480px X 480px

# Make Plot 2
with(data, plot(dmy(Date) + hms(Time), as.numeric(Global_active_power), 
                xlab = '', type = 'l',
                ylab = 'Global Active Power (kilowatts)'))

# Close png file
dev.off()



