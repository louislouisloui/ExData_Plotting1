extract_data2 <- function() {
  
  #Extract datas
  data <- read.table(file = "./household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors = FALSE)
  data_frame <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
}

plot2 <- function(data_frame) {

  #Set the dates format
  #data <- mutate(data, date= as.Date(Date), time=strptime(Time,"%H:%M:%S"))
  date_time  <- with(data_frame, as.POSIXct(paste(Date,Time, sep = "-"), format="%e/%m/%Y-%H:%M:%S"))
  data_frame$date_time <- date_time
  
  #Set the graphic device as png
  png(filename = "plot2.png")
  
  #Plot the chart
  plot(data_frame$date_time, data_frame$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
  
  #Close the graphic device
  dev.off()
}