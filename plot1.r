plot1  <-  function() {

        #Read data into R

        fn <- "C:\\Users\\Owner\\Downloads\\household_power_consumption.txt" #absolute file path
        pow.df <- read.table(fn, nrows = 2880, skip = 66637, sep = ";", na.strings = "?") #data only for the period being analyzed
        
        df.cols <- c("Date", "Time", "GAP", "GRaP", "Volt", "GI", "Sm1", "Sm2", "Sm3") #column names
        colnames(pow.df) <- df.cols #data frame column relabeling

        png("plot1.png")

        #Draw histogram and relabel axes

        gap.data <- pow.df$GAP[!is.na(pow.df$GAP)]

        hist(gap.data, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, col = "red")

        dev.close()
}