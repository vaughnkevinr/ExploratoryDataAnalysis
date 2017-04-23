plot1<-function(){
  dataFile <- "./household_power_consumption.txt"
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  par(mfrow=c(1,1))
  df<-subSetData
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
  
}
