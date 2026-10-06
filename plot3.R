library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

baltimore_data <- subset(NEI, fips == "24510")
baltimore_type <- aggregate(Emissions ~ year + type, baltimore_data, sum)

png("plot3.png", width=480, height=480)

g <- ggplot(baltimore_type, aes(x=factor(year), y=Emissions, fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(. ~ type) +
        labs(x="Year", y="Total PM2.5 Emissions (Tons)", 
             title="Baltimore City Emissions by Source Type") +
        theme_minimal()

print(g)
dev.off()