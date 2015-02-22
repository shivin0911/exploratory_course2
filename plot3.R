##SHIVIN SINGH
##22-02-2015
library(plyr)
library(ggplot2)
#Read the rds Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Open graphics device
png(filename="figure/plot3.png", width=480, height=480)
plotData <- ddply(NEI[NEI$fips == "24510",], c("year", "type"), 
                 function(df)sum(df$Emissions, na.rm=TRUE))
#Plot final data to see which of the 4 sources have seen decreased emissions
ggplot(data=plotData, aes(x=year, y=V1, group=type, colour=type)) +
  geom_line() +
  xlab("Year") +
  ylab("PM2.5 (tons)") +
  ggtitle("Total PM2.5 Emissions (tons) Per Year by Source Type")
#shutdown device
dev.off()
