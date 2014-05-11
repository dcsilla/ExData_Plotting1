plot2 <- function() {
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
  
  ## extract Date and Global Active Power data
  ## handle dates
  GAPower<-data[3]
  
  Sys.setlocale("LC_TIME", "C")    #thanks to Tamas Kurics!
  dates<-data[1]
  hours<-data[2]
  x<-paste(dates[,1],hours[,1])
  times<-strptime(x, "%e/%m/%Y %H:%M:%S")
  
  ## plot
  png(filename="plot2.png")
  plot(times,GAPower[,1],type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}