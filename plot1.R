
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


#plot 1
if(!file.exists('figures')) dir.create("figures")
png(filename="./figures/plot1.png",width=480,height=480,unit="px")
hist(as.numeric(subsetdata$Global_active_power),col="red",xlab="Global Active Power (killowatts)", main="Global Active Power")
dev.off()