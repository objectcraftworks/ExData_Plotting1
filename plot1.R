source("./load_tidyr.R")

two_days_consumption <- load_feb_oseven_first_two_days()

png("./plot1.png")

hist(two_days_consumption$Global_active_power,col="RED",
     main="Global Active Power",xlab="Global Active Power(killowatts)")
dev.off()