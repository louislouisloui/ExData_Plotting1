Extract_data1 <- function() {
  
  #Extract datas
  data <- read.table(file = "./household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors = FALSE)
  data_frame <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
}


plot1 <- function(data_frame) {

  
  #Set the graphic device as png
  png(filename = "plot1.png")
  
  #Create the chart
  hist(data_frame$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")
  
  #Close the graphic device
  dev.off()
  
}