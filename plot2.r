plot2  <-  function() {

        #Read data into 

        fn <- "C:\\Users\\Owner\\Downloads\\household_power_consumption.txt" #absolute file path
        pow.df <- read.table(fn, nrows = 2880, skip = 66637, sep = ";", na.strings = "?") #data only for the period being analyzed
        
        df.cols <- c("Date", "Time", "GAP", "GRaP", "Volt", "GI", "Sm1", "Sm2", "Sm3") #column names
        colnames(pow.df) <- df.cols #data frame column relabeling

        png("plot2.png")

        #Draw histogram and relabel axes
        gap.data<-pow.df$GAP[!is.na(pow.df$GAP)]
        xlabs<-c("Thu", "Fri", "Sat")
        plot(1:2880, gap.data, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", axes = FALSE)

        box(which = "plot", col = "grey")
        axis(side = 1, at = c(0, 1440, 2880), labels = xlabs)
        axis(side = 2, at = seq(0, 30, 10), labels = seq(0, 30, 10))

        dev.close()
}
