setwd("F://Coursera//Exploratory Data Analysis//Workdir")
header=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<-read.csv("household_power_consumption.txt",header=F,sep=";",
               col.names=header,na.strings="?",nrows=2880,skip=66637)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
png("plot1.png")
with(data,hist(Global_active_power,col="red",
               xlab="Global Active Power(kilowatts)",main="Global Active Power"))
dev.off()