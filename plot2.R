setwd("F://Coursera//Exploratory Data Analysis//Workdir")
header=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<-read.csv("household_power_consumption.txt",header=F,sep=";",
               col.names=header,na.strings="?",nrows=2880,skip=66637)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time),tz="GMT",format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
with(data,{
  plot(Time,Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="n")
  lines(Time,Global_active_power)
    })
dev.off()
