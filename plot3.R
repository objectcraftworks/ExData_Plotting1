source("./load_tidyr.R")

library("lattice")
two_days_consumption <- load_feb_oseven_first_two_days()

png("./plot3.png")

with(two_days_consumption, plot(Time_Stamp,Sub_metering_1 ,type="l",
     ylab="Energy Sub metering", xlab=""))
with(two_days_consumption,lines(Time_Stamp,Sub_metering_2,col="RED"))
with(two_days_consumption,lines(Time_Stamp,Sub_metering_3,col="BLUE"))

legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('BLACK', 'RED', 'BLUE'), 
       lty='solid')

dev.off()