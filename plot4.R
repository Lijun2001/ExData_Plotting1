#set working directory 
setwd("c:/Users/Lijun/Documents/Project")

#download data
if(!file.exists('ProjectData')) dir.create("ProjectData")
myurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myurl,destfile="./ProjectData/household_power_consumption.zip")
unzip("./ProjectData/household_power_consumption.zip",exdir="./ProjectData")

#read data
myfile<-"./ProjectData/household_power_consumption.txt"
mydata<-read.table(myfile,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".")
subsetdata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
DateTime<-strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")



#plot 4
if(!file.exists('figures')) dir.create("figures")
png(filename="./figures/plot4.png",width=480,height=480,unit="px")
par(mfrow=c(2,2))
#Sys.setlocale(category="LC_ALL",locale="english")


plot(DateTime,subsetdata$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(DateTime,subsetdata$Voltage,xlab="DateTime",ylab="Voltage",type="l")
plot(DateTime,subsetdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")

lines(DateTime,subsetdata$Sub_metering_2,col="red")
lines(DateTime,subsetdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(DateTime,subsetdata$Global_reactive_power,xlab="",ylab="Global_reactive_power",type="l")

dev.off()