# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


sbstNEI  <- NEI[NEI$fips=="24510", ]

aggregatedByYear <- aggregate(Emissions ~ year, sbstNEI, sum)

png('plot2.png')
barplot(height=aggregatedByYear$Emissions, names.arg=aggregatedByYear$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City per years'), 
        col = "red")
dev.off()