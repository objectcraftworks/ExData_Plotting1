

library(sqldf)
library(lubridate)

load_feb_oseven_first_two_days<- function(){

  
data_url <-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip_file <- "./data/household_power_consumption.zip"
data_file <- "./data/household_power_consumption.txt"
tidyr_file <- "./data/household_power_consumption_tidyr.csv"
## if required data file tidyr_file doesn't exist, download, and tidyr it for plots

if(! file.exists(tidyr_file)) {
 if(!file.exists("./data/")) {
   dir.create("./data/")
 }
download.file(data_url, destfile=zip_file, method="curl")
unzip(zip_file,exdir="./data")

on.exit(sqldf()) # close underlying connection on exit, as read.csv2.sql is not closing the connection

## Read Feb 1, 2 data using SqlDf package
### Note: without eol=\r\n, in my machine, csv2.sql was returning last column with \r appended.
power_consumption <- read.csv2.sql(file=file.path("./" ,data_file),
               sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",
               colClasses="character",row.names=NULL,eol="\r\n")


## Replace ? with NAs, 
power_consumption[,][power_consumption[,]== "?"] <- NA
power_consumption$Time_Stamp <-format(strptime(paste(power_consumption$Date,
                                                     power_consumption$Time),
                                            format="%d/%m/%Y %T"), 
                                      format= "%m-%d-%Y %T")
                                      

## convert date and time

## write to a tidyr file, as input to plotX.R scripts
write.csv(power_consumption,file=tidyr_file)
}

power_consumption <- read.csv(file=tidyr_file)
power_consumption$Time_Stamp <- strptime(power_consumption$Time_Stamp,format="%m-%d-%Y %T")
power_consumption
}

