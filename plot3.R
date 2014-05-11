plot3 <- function() {
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
  
  ## extract Date and sub_metering data
  ## handle dates
  Sub_metering_1<-data[7]
  Sub_metering_2<-data[8]
  Sub_metering_3<-data[9]
  
  Sys.setlocale("LC_TIME", "C")    #thanks to Tamas Kurics!
  dates<-data[1]
  hours<-data[2]
  x<-paste(dates[,1],hours[,1])
  times<-strptime(x, "%e/%m/%Y %H:%M:%S")
  
  ## plot
  png(filename="plot3.png")
  plot(times,Sub_metering_1[,1],type="l",main="",xlab="",ylab="Energy sub metering")
  lines(times,Sub_metering_2[,1],col="RED")
  lines(times,Sub_metering_3[,1],col="BLUE")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("BLACK","RED","BLUE"),lty=1)
  dev.off()
}