# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")

# Group data by year and calculate the sum of emissions
total_emissions <- aggregate(Emissions ~ year, NEI, sum)

# Prepare to save the plot as a PNG picture
png("plot1.png", width=480, height=480)

# Draw a bar chart (divide emissions by 1 million to make labels clean)
barplot(total_emissions$Emissions/10^6, names.arg=total_emissions$year,
        xlab="Year", ylab="PM2.5 Emissions (Millions of Tons)",
        main="Total PM2.5 Emissions in the United States")

# Save and close the picture file
dev.off()