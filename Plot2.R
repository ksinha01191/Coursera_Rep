hpc = read.table("household_power_consumption 2.txt",sep = ";", header = T)
hpc_date=subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
DT <- strptime(paste(hpc_date$Date, hpc_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap_num= as.numeric(levels(hpc_date$Global_active_power))[hpc_date$Global_active_power]
png("plot2.png", width=480, height=480)
plot(DT, gap_num, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

