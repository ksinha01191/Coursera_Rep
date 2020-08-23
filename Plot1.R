hpc = read.table("household_power_consumption 2.txt",sep = ";", header = T)
hpc_date=subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
gap_num= as.numeric(levels(hpc_date$Global_active_power))[hpc_date$Global_active_power]
png("plot1.png", width=480, height=480)
hist(gap_num,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
#plot1
