powerdata<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

smallset <- powerdata[(powerdata$Date == "1/2/2007") | (powerdata$Date =="2/2/2007"),]
library(data.table)
smallsetDT<-data.table(smallset)
x<-smallsetDT[,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

png(file="plot3.png")
plot(x,smallsetDT$Sub_metering_1, main="",type="l",ylab="Energy sub metering",xlab="")
lines(x,smallsetDT$Sub_metering_2,col="red",type="l")
lines(x,smallsetDT$Sub_metering_3,col="blue",type="l")
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()