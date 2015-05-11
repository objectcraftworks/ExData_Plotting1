### Folder structure

* Update: Deleted the data folder to size limitation ~~data contains the original dataset~~ 
* tidyr file, an intermediate dataset used by all plot*.R scripts
* PlotX.R and PlotX.png files are in the root folder
* load_tidyr.R script, which is sourced in all the plot scripts

### Getting and Tidying the data for graphical analysis

If Tidyr file `household_power_consumption_tidyr.csv` doesn't exist in "./data" directory, sourced script `load_tidyr.R` downloads, and unzips the dataset. It also substitutes `NAs for ?`, which is the missing value of the original dataset.
It creates a timestamp column which is in the local timezone, i.e. These plots will be in the timezone of the system running these scripts.

> As the focus is on the first two days of feb 2007, the tidyr file contains observations for these two days only. 

### Variables:
The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

Variables added:

1.Time_Stamp: Datetime in local time zone

Variables from original dataset:
 
1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
