# libraries
require(utils)

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
png('./plot1.png') # default is 480px X 480px

# Make Plot 1
with(data, hist(as.numeric(Global_active_power), col = 'red',
                xlab = 'Global Active Power (kilowatts)',
                main = 'Global Active Power'))

# Close png file
dev.off()
