hpc = read.table("household_power_consumption 2.txt",sep = ";", header = T)
hpc_date=subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
DT <- strptime(paste(hpc_date$Date, hpc_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
numsm1 = as.numeric(levels(hpc_date$Sub_metering_1))[hpc_date$Sub_metering_1]
numsm2 = as.numeric(levels(hpc_date$Sub_metering_2))[hpc_date$Sub_metering_2]
gap_num= as.numeric(levels(hpc_date$Global_active_power))[hpc_date$Global_active_power]
grp_num = as.numeric(levels(hpc_date$Global_reactive_power))[hpc_date$Global_reactive_power]
numvolt = as.numeric(levels(hpc_date$Voltage))[hpc_date$Voltage]
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(DT, gap_num, xlab = "", ylab="Global Active Power", type="l")
plot(DT, numvolt, xlab="datetime", ylab="Voltage", type="l")
plot(DT, numsm1, col = "black", type = "l", xlab="", ylab = "Energy Sub metering")
lines(DT, numsm2, col = "red", type = "l")
lines(DT, hpc_date$Sub_metering_3, col="blue", type = "l")
legend("topright",  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
plot(DT, grp_num, xlab="datetime", ylab="Global_Reactive_Power", type="l")
dev.off()
