library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

# Filter for Baltimore vehicles using the ON-ROAD source type
baltimore_vehicles <- subset(NEI, fips == "24510" & type == "ON-ROAD")
vehicle_emissions <- aggregate(Emissions ~ year, baltimore_vehicles, sum)

png("plot5.png", width=480, height=480)

g <- ggplot(vehicle_emissions, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity", fill="steelblue") +
        labs(x="Year", y="Total PM2.5 Emissions (Tons)", 
             title="Motor Vehicle Emissions in Baltimore City") +
        theme_minimal()

print(g)
dev.off()