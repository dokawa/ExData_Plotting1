plot_3 <- function() {
  
  filename = "exdata-data-household_power_consumption.zip"
  if(!file.exists(filename)) {
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", filename)
    file <- unzip(filename)
  }
  
  power_table <- read.table(file, header=TRUE, sep=";")
  power_table$Date <- as.Date(power_table$Date, format="%d/%m/%Y")
  df <- power_table[(power_table$Date=="2007-02-01") | (power_table$Date=="2007-02-02"), ]
  
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time), tz="America/Los_Angeles"), "%d/%m/%Y %H:%M:%S")
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  
  plot(df$timestamp, df$Sub_metering_1, type= "l",xlab="", ylab= "Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2,col="red")
  lines(df$timestamp,df$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  
  filename = "plot3.png"
  dev.copy(png, file=filename, width=480, height=480)
  dev.off()
  cat(filename, ".png has been saved in", getwd())
}
