NEI <- readRDS("summarySCC_PM25.rds")

# Filter data to only look at Baltimore City (fips is 24510)
baltimore_data <- subset(NEI, fips == "24510")
baltimore_emissions <- aggregate(Emissions ~ year, baltimore_data, sum)

png("plot2.png", width=480, height=480)

barplot(baltimore_emissions$Emissions, names.arg=baltimore_emissions$year,
        xlab="Year", ylab="Total PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions in Baltimore City, MD")

dev.off()
