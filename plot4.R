library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find codes related to Coal Combustion
combustion_coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector, ignore.case=TRUE)
coal_scc <- SCC[combustion_coal, ]$SCC

# Filter emissions dataset using those codes
coal_nei <- NEI[NEI$SCC %in% coal_scc, ]
coal_emissions <- aggregate(Emissions ~ year, coal_nei, sum)

png("plot4.png", width=480, height=480)

g <- ggplot(coal_emissions, aes(x=factor(year), y=Emissions/10^5)) +
        geom_bar(stat="identity", fill="darkgray") +
        labs(x="Year", y="PM2.5 Emissions (Hundreds of Thousands of Tons)", 
             title="Coal Combustion-Related Emissions across the US") +
        theme_minimal()

print(g)
dev.off()