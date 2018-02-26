## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999-2008?

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEISCCmrg <- merge(NEI, SCC, by="SCC")

NEISCCdp <- tbl_df(NEISCCmrg)


NEISCCdp <- mutate(NEISCCdp, coal = grepl("coal", NEISCCdp$Short.Name, 
                                          ignore.case=TRUE)) 

EmissionsCoalYear <- summarize(group_by(filter(NEISCCdp, coal==TRUE),year),
                               sum(Emissions))
colnames(EmissionsCoalYear) <- c("Year", "Emissions") 

EmissionsCoalYear$Year <- as.character(EmissionsCoalYear$Year)


EmissionsCoalYear$EmissionsInTousands = EmissionsCoalYear$Emissions/1000


png('plot4.png')
gplt <- ggplot(EmissionsCoalYear, aes(Year, EmissionsInTousands))
gplt+geom_bar(stat='identity')+labs(title="Emissions from coal combustion-related 
                                    sources", x="Years",y="Emissions (PM 2.5) 
                                    in thousands")
dev.off()