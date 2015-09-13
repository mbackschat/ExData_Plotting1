## plot4.R: Use of subplot in R

# Read data
data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')

# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007               
subdata<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Convert the data to date and time
subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

# Set english language for days, see https://class.coursera.org/exdata-032/forum/thread?thread_id=7
Sys.setlocale("LC_TIME", "en_US")

# Open plot4.png
png("plot4.png", height = 480, width = 480)

# Set up multi plot
par(mfrow=c(2,2))

# Plot Global Active Power plot
plot(subdata$datetime,subdata$Global_active_power,xlab ="", ylab = "Global Active Power", type ="l")

# Plot Voltage
plot(subdata$datetime,subdata$Voltage,xlab ="datetime", ylab = "Voltage", type ="l")

# Plot Energy sub metering
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(subdata$datetime,subdata$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(subdata$datetime,subdata$Sub_metering_2, col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, col = "blue")
legend('topright',legend=cols ,col=c('black','red','blue'), lty = 1, lwd = 3)

# Plot Global Reactive power
plot(subdata$datetime,subdata$Global_reactive_power,xlab ="datetime", ylab = "Global_reactive_power", type ="l")

# Close png file
+dev.off()
