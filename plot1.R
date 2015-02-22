##Shivin Singh
##22-02-2015
##Exploratory Course Project 2:Question 1
#Read the rds data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Sum of all emissions group by individual years
aggData<-with (NEI,aggregate(NEI[,'Emissions'],by=list(year), sum, na.rm=TRUE))
#Change the col names for this aggregared data to more meaningful
names(aggData) <- c('Year', 'TotEmission')
#Open the graphic device to plot the data
png(filename='figure/plot1.png', width=480, height=480, units='px')
#Plot the aggregated data of total emissions from PM2.5 for all the years
plot(aggData, type="l", xlab="Year", ylab="Total PM2.5 Emmision From All Sources Between 1999-2008", 
     col="dark red", xaxt="n", main="Total Emissions (tons)")
#Plot the x-axis that contains the year
axis(1, at=as.integer(aggData$Year), las=1)
#Shut the graphic device
dev.off()