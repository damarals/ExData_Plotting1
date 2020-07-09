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
data <- read.table('household_power_consumption.txt', header = T, sep = ';')
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

# Delete data file .txt
if(file.exists('./household_power_consumption.txt')) {
  invisible(file.remove('./household_power_consumption.txt'))
}

# Make Plot 1



