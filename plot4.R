setwd("F://Coursera//Exploratory Data Analysis//Workdir")
header=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<-read.csv("household_power_consumption.txt",header=F,sep=";",
               col.names=header,na.strings="?",nrows=2880,skip=66637)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time),tz="GMT",format="%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfcol=c(2,2))
with(data,{
            {plot(Time,Global_active_power,xlab="",ylab="Global Active Power",type="n")
             lines(Time,Global_active_power)}
            {plot(Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
             lines(Time,Sub_metering_1)
             lines(Time,Sub_metering_2,col="red")
             lines(Time,Sub_metering_3,col="blue")
             legend("topright",lty=1,col=c("black","red","blue"),bty="n",
                    legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
            {plot(Time,Voltage,xlab="datetime",type="n")
             lines(Time,Voltage)}
            {plot(Time,Global_reactive_power,xlab="datetime",type="n")
             lines(Time,Global_reactive_power)}

  
})
dev.off()

