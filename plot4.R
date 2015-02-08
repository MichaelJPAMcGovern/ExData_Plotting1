plot4 <- function(){
        #Read data into 

        fn <- "C:\\Users\\Owner\\Downloads\\household_power_consumption.txt" #absolute file path
        pow.df <- read.table(fn, nrows = 2880, skip = 66637, sep = ";", na.strings = "?") #data only for the period being analyzed
        
        df.cols <- c("Date", "Time", "GAP", "GRaP", "Volt", "GI", "Sm1", "Sm2", "Sm3") #column names
        colnames(pow.df) <- df.cols #data frame column relabeling

        png("plot4.png")

        #Draw histogram and relabel axes     gap.data <- pow.df$GAP[!is.na(pow.df$GAP)]

        gap.data <- pow.df$GAP[!is.na(pow.df$GAP)]
        grap.data <- pow.df$GRaP[!is.na(pow.df$GRaP)]
        volt.data <- pow.df$Volt[!is.na(pow.df$Vol)]
        sm1.data <- pow.df$Sm1[!is.na(pow.df$Sm1)]
        sm2.data <- pow.df$Sm2[!is.na(pow.df$Sm2)]
        sm3.data <- pow.df$Sm3[!is.na(pow.df$Sm3)]

        xlabs <- c("Thu", "Fri", "Sat")
        sm.labs <- (c("sub_metering_1", "sub_metering_2", "sub_metering_3"))



        par(mfrow = c(2, 2))


        plot(1:2880, gap.data, type = "l", xlab = "", ylab = "Global Active Power", axes = FALSE)
        box(which = "plot", col = "grey")
        axis(side = 1, at = c(0, 1440, 2880), labels = xlabs)
        axis(side = 2, at = seq(0, 6, 2))

        plot(1:2880, volt.data, type = "l", xlab = "datetime", ylab = "Voltage", axes = FALSE)
        box(which = "plot", col = "grey")
        axis(side = 1, at = c(0, 1440, 2880), labels = xlabs)
        axis(side = 2, at = seq(234, 246, 2), labels = c(234, "", 238, "", 242, "", 246))

        plot(1:length(sm1.data), sm1.data, xlab = "", type = "l", ylab = "Energy sub metering", axes = FALSE)  #initial line plot of submetering 1 data with NAs removed
        lines(1:length(sm2.data), sm2.data, type = "l", col = "red")  #addition of submetering 2 plotted data to initial plot
        lines(1:length(sm2.data), sm3.data, type = "l", col = "blue")  #addition of submetering 3 plotted data to initial plot      
        
        box(which = "plot", col = "grey")
        axis(side = 1, at = c(0, 1440, 2880), labels = xlabs)
        axis(side = 2, at = seq(0, 30, 10), labels = seq(0, 30, 10))
        legend(720, 40, sm.labs, lty = c(1, 1, 1), lwd = c(1.5, 1.5, 1.5), col = c("black", "red", "blue"))

        plot(1:2880, grap.data, type = "l", xlab = "datetime", ylab = "Global_reactive_power", axes = FALSE)
        box(which = "plot", col = "grey")
        axis(side = 1, at = c(0, 1440, 2880), labels = xlabs)
        axis(side = 2, at = seq(0.0, 0.5, 0.1), labels = seq(0, .5, .1))

        dev.close()
}