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
DateTime<-strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "),"%d /%m /%Y %H:%M:%S")


#plot 2
if(!file.exists('figures')) dir.create("figures")
png(filename="./figures/plot2.png",width=480,height=480,unit="px")
Sys.setlocale(category="LC_ALL",locale="English")
plot(DateTime,subsetdata$Global_active_power,xlab="",ylab="Global Active Power (killowatt)",type="l")
dev.off()