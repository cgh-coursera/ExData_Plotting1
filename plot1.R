powerdata<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

smallset <- powerdata[(powerdata$Date == "1/2/2007") | (powerdata$Date =="2/2/2007"),]
hist(smallset$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()
