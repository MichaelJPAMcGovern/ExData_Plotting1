plot3  <-  function() {

        #Read data into 

        fn <- "C:\\Users\\Owner\\Downloads\\household_power_consumption.txt" #absolute file path
        pow.df <- read.table(fn, nrows = 2880, skip = 66637, sep = ";", na.strings = "?") #data only for the period being analyzed
        
        df.cols <- c("Date", "Time", "GAP", "GRaP", "Volt", "GI", "Sm1", "Sm2", "Sm3") #column names
        colnames(pow.df) <- df.cols #data frame column relabeling

        png("plot3.png")

        #Draw histogram and relabel axes

        sm1.data <- pow.df$Sm1[!is.na(pow.df$GAP)] #submetering 1 data with NAs removed
        sm2.data <- pow.df$Sm2[!is.na(pow.df$GAP)] #submetering 2 data with NAs removed
        sm3.data <- pow.df$Sm3[!is.na(pow.df$GAP)] #submetering 2 data with NAs removed

        xlabs <- c("Thu", "Fri", "Sat")

        sm.labs <- (c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

        plot(1:length(sm1.data), sm1.data, type = "l", ylab = "Energy sub metering", axes = FALSE)  #initial line plot of submetering 1 data with NAs removed
        lines(1:length(sm2.data), sm2.data, type = "l", col = "red")  #addition of submetering 2 plotted data to initial plot
        lines(1:length(sm2.data), sm3.data, type = "l", col = "blue")  #addition of submetering 3 plotted data to initial plot      
        
        box(which = "plot", col = "grey")
        axis(side = 1, at = c(0, 1440, 2880), labels = xlabs)
        axis(side = 2, at = seq(0, 30, 10), labels = seq(0, 30, 10))
        legend(1801, 40, sm.labs, lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))

        #bmp("plot3.bmp")
        jpeg("plot3.jpeg")
        png("plot3.png")
        tiff("plot3.tiff")

        dev.close()
}
