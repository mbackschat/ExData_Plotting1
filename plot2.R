## plot2.R: Global Active Power for Feb 01, 2007 and Feb 02, 2007

# Read data
data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')

# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007               
subdata<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

# Convert the data to date and time
subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

# Set english language for days, see https://class.coursera.org/exdata-032/forum/thread?thread_id=7
Sys.setlocale("LC_TIME", "en_US")

# Open plot1.png
png("plot2.png", height = 480, width = 480)

plot(subdata$datetime, subdata$Global_active_power,
     xlab ="", ylab = "Global Active Power (kilowatts)",
     type ="l")

# Close png file
+dev.off()
