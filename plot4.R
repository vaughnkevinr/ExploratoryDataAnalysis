plot4<-function(){
  dataFile <- "./household_power_consumption.txt"
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  df<-subSetData
  
  par(mfrow=c(2,2))
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")  
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  df$Voltage <- as.numeric(as.character(df$Voltage))
  plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  par(mar = c(5,5,2,2))
  plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2, col = "red")
  lines(df$timestamp,df$Sub_metering_3,col = "blue")
  
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col = c("black","red","blue"),bty="n")
  
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("Plot4.png has been saved in", getwd())
  
}
