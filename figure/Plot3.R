# Load necessary libraries
library(utils)
library(ggplot2)

# Load the data files
NEI <- readRDS("summarySCC_PM25.rds")

# Filter data for Baltimore City (fips == "24510")
baltimore_data <- subset(NEI, fips == "24510")

# Aggregate total emissions by year and source type in Baltimore City
baltimore_emissions_by_type <- aggregate(Emissions ~ year + type, data = baltimore_data, sum)

# Create the plot and save it as a PNG file
png(filename = "plot3.png", width = 480, height = 480, res = 100)

# Plot total PM2.5 emissions by year and source type in Baltimore City
ggplot(baltimore_emissions_by_type, aes(x = year, y = Emissions, color = type)) +
    geom_line() +
    geom_point() +
    labs(
        title = "Emissions by Source Type in Baltimore City (1999-2008)",
        x = "Year",
        y = "Emissions (tons)"
    ) +
    theme_minimal()

# Close the PNG device
dev.off()
