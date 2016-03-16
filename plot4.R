extract_data4 <- function() {
  
  #Extract datas
  data <- read.table(file = "./household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors = FALSE)
  data_frame <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
}

plot2 <- function(data_frame) {
  
  #Plot the chart
  plot(data_frame$date_time, data_frame$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
  
}


plot3 <-  function (data_frame) {
  
  #Plot the chart
  plot(data_frame$date_time, data_frame$Sub_metering_1, type = "l", xlab="",ylab = "Energy sub metering")
  lines(data_frame$date_time, data_frame$Sub_metering_2, type = "l", col="red")
  lines(data_frame$date_time, data_frame$Sub_metering_3, type = "l", col="blue")
  
  #add a legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n") 
  
}


plot4 <-  function (data_frame) {
  
  #Set the dates format
  #data <- mutate(data, date= as.Date(Date), time=strptime(Time,"%H:%M:%S"))
  date_time  <- with(data_frame, as.POSIXct(paste(Date,Time, sep = "-"), format="%e/%m/%Y-%H:%M:%S"))
  data_frame$date_time <- date_time
  
  #Set the graphic device as png
  png(filename = "plot4.png")
  
  #Set the frame
  par(mfcol=c(2,2))
  
  #Plot the charts
  plot2(data_frame)
  plot3(data_frame)
  plot(data_frame$date_time, data_frame$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
  plot(data_frame$date_time, data_frame$Global_reactive_power, xlab="datetime", ylab="Globabl_active_power", type="l")
  
  #Close the graphic device
  dev.off()
  
}