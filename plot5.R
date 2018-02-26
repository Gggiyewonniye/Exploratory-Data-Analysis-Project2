## How have emissions from motor vehicle sources changed from 1999-2008 
## in Baltimore City? 

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehiclesSCC <- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE), SCC]
vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC,]


btmrvclsNEI <- vehiclesNEI[fips=="24510",]

png("plot5.png")

ggplot(btmrvclsNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="#FF9999" ,width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore 
                        from 1999-2008"))

dev.off()