plot_1 <- function () {
  
  filename = "exdata-data-household_power_consumption.zip"
  if(!file.exists(filename)) {
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", filename)
    file <- unzip(filename)
  }
  
  power_table <- read.table(file, header=TRUE, sep=";")
  power_table$Date <- as.Date(power_table$Date, format="%d/%m/%Y")
  df <- power_table[(power_table$Date=="2007-02-01") | (power_table$Date=="2007-02-02"), ]
  
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  hist(df$Global_active_power, main= "Global Active Power", col= "red", xlab= "Global Active Power (kilowatts)")
  
  filename = "plot1.png"
  dev.copy(png, file=filename, width=480, height=480)
  dev.off()
  cat(filename, ".png has been saved in", getwd())
}

