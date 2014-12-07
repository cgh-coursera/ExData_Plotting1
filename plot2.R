powerdata<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

smallset <- powerdata[(powerdata$Date == "1/2/2007") | (powerdata$Date =="2/2/2007"),]
library(data.table)
smallsetDT<-data.table(smallset)
x<-smallsetDT[,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]
# plot(x,smallsetDT$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
plot(x,smallsetDT$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()