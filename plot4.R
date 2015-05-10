source("./load_tidyr.R")

two_days_consumption <- load_feb_oseven_first_two_days()

png("./plot4.png")

## Go row wise
par(mfrow=c(2,2))

#First Graph TopLeft  DateTime Vs Global Active Power
with(two_days_consumption, plot(Time_Stamp,Global_active_power ,type="l",
                                ylab="Global Active Power(killowatts)", xlab=""))

# Second Graph TopRight : DateTime Vs Voltage
with(two_days_consumption, plot(Time_Stamp,Voltage ,type="l",
                                xlab="datetime",    ylab="Voltage"))


# Third Graph : BottomLeft: DateTime Vs EnergySubmeter1-3

with(two_days_consumption, plot(Time_Stamp,Sub_metering_1 ,type="l",
                                ylab="Global Active Power(killowatts)", xlab=""))
with(two_days_consumption,lines(Time_Stamp,Sub_metering_2,col="RED"))
with(two_days_consumption,lines(Time_Stamp,Sub_metering_3,col="BLUE"))

legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('BLACK', 'RED', 'BLUE'), 
       lty='solid')

# Final graph: Bottom Right: DateTime Vs Global Reactive Power
with(two_days_consumption, plot(Time_Stamp,Global_reactive_power ,type="l",
                                xlab="",    ylab="Global Reactive Power"))

dev.off()