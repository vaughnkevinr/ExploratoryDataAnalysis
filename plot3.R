plot3<-function(){
  dataFile <- "./household_power_consumption.txt"
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  df<-subSetData
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")  
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  par(mfrow=c(1,1))
  plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2, col = "red")
  lines(df$timestamp,df$Sub_metering_3,col = "blue")
  
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col = c("black","red","blue"))
  
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("Plot3.png has been saved in", getwd())
  
}
