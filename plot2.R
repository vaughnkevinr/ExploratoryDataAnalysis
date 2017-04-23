plot2<-function(){
  dataFile <- "./household_power_consumption.txt"
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  par(mfrow=c(1,1))
  df<-subSetData
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")  
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("Plot2.png has been saved in", getwd())
  
}
