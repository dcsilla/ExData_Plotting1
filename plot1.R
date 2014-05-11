plot1 <- function() {
  ## plot of electric power consumption
  ## frequency ~ global active power

  library(datasets)
  
  ## read data : read data for 2007.02.01. and 2007.02.02. separately, then merge
    
  initial<-read.table("household_power_consumption.txt",sep=";",nrows=100,header=TRUE)
  colClasses<-sapply(initial,class)
  data_full<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=colClasses,na.strings="?")
  data1<-data_full[data_full$Date=="1/2/2007",]
  data2<-data_full[data_full$Date=="2/2/2007",]
  data<-merge(data1,data2,all=TRUE)
  
  ## extract Global Active Power Data and make a histogram
  GAPower<-data[3]
  
  png(filename="plot1.png")
  hist(GAPower[,1],col="RED",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
  
  #return(head(data))
}