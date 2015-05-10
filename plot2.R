source("./load_tidyr.R")

two_days_consumption <- load_feb_oseven_first_two_days()

png("./plot2.png")

with(two_days_consumption, plot(Time_Stamp,Global_active_power ,type="l",
     ylab="Global Active Power(killowatts)", xlab=""))

dev.off()