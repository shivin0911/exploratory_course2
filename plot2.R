## SHIVIN SINGH
## 22-02-2015
##Question 2
library(plyr)
#Read the rds Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#First we aggregate total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") from 1999 to 2008.
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
#Open graphics device
png(filename="figure/plot2.png", width=480, height=480)
barplot(aggTotalsBaltimore$Emissions,names.arg=aggTotalsBaltimore$year,xlab="Year",ylab="PM2.5 Emissions (Tons)",main="Total PM2.5 Emissions From All Baltimore City Sources")
#shutdown graphic device
dev.off()