## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
head(NEI)

range(NEI$year)


rm(list = ls())
NEI <- readRDS("summarySCC_PM25.rds")
head(NEI)

range(NEI$year)

aggregatedByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(aggregatedByYear$Emissions, names.arg=aggregatedByYear$year, 
          xlab="Years", ylab=expression('total PM'[2.5]*' emission'),
          main=expression('Total PM'[2.5]*' emissions per years'), col = "blue")

dev.off()