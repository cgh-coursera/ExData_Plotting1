powerdata<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

smallset <- powerdata[(powerdata$Date == "1/2/2007") | (powerdata$Date =="2/2/2007"),]
library(data.table)
smallsetDT<-data.table(smallset)
x<-smallsetDT[,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

png(file="plot4.png")

par(mfrow=c(2,2))

# top left
plot(x,smallset$Global_active_power,type="l",ylab="Global Active Power",xlab="")

# top right
plot(x,smallsetDT$Voltage,type="l",ylab="Voltage",xlab="datetime")

# bottom left
plot(x,smallsetDT$Sub_metering_1, main="",type="l",ylab="Energy sub metering",xlab="")
lines(x,smallsetDT$Sub_metering_2,col="red",type="l")
lines(x,smallsetDT$Sub_metering_3,col="blue",type="l")
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# bottom right
plot(x,smallsetDT$Global_reactive_power,type="h",ylab="Global_reactive_power",xlab="datetime",lwd=1)


dev.off()