#Set working directory and folder to store data
setwd('/Users/lawrence_tomaziefski/R_Working_Directory/161130_Exploratory_Data_Analysis')
dir.create("./energy_use")
path = ("./energy_use/")
require(dplyr)
require(data.table)
require(lubridate)

household_power = read.table(paste0(path,"household_power_consumption.txt"),
                             header = TRUE, 
                             na.strings = "NA", 
                             sep = ";",
                             dec = ".",
                             stringsAsFactors = FALSE)
household_power = mutate(household_power,
                         datetime = dmy_hms(paste(household_power$Date,household_power$Time)))
household_power = mutate(household_power,Date = dmy(household_power$Date))
household_power = filter(household_power,Date == "2007-02-01" | Date == "2007-02-02")

for(i in 3:9){
        household_power[,i] = as.numeric(household_power[,i])
}
width = 480
height = 480

with(household_power,plot(datetime,Global_active_power, type = "l",
                                ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png",width = width, height = height)
## Don't forget to close the PNG device!
dev.off()

     
     





