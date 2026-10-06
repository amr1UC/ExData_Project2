library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

# Filter for Baltimore and Los Angeles vehicle data
compare_data <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
compare_emissions <- aggregate(Emissions ~ year + fips, compare_data, sum)

# Change numbers into clean text names
compare_emissions$City <- ifelse(compare_emissions$fips == "24510", "Baltimore City", "Los Angeles County")

png("plot6.png", width=550, height=480)

g <- ggplot(compare_emissions, aes(x=factor(year), y=Emissions, fill=City)) +
        geom_bar(stat="identity", position="dodge") +
        facet_grid(City ~ ., scales="free") +
        labs(x="Year", y="Total PM2.5 Emissions (Tons)", 
             title="Motor Vehicle Emissions: Baltimore vs. Los Angeles") +
        theme_minimal()

print(g)
dev.off()