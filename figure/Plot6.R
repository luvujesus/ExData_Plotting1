# Load necessary libraries
library(ggplot2)

# Load the data file
NEI <- readRDS("summarySCC_PM25.rds")

# Filter data for Baltimore City (fips == "24510")
baltimore_data <- subset(NEI, fips == "24510")

# Aggregate total emissions by year and source type in Baltimore City
baltimore_emissions_by_type <- aggregate(Emissions ~ year + type, data = baltimore_data, sum)

# Create the plot and save it as a PNG file
png(filename = "plot3.png", width = 640, height = 480, res = 100)  # Open PNG device

# Create a ggplot2 plot showing PM2.5 emissions by year and source type in Baltimore City
ggplot(baltimore_emissions_by_type, aes(x = year, y = Emissions, color = type, group = type)) +
    geom_line() +  # Line plot
    geom_point() +  # Points on the line
    labs(
        title = "PM2.5 Emissions in Baltimore City by Source Type (1999-2008)",
        x = "Year",
        y = "Emissions (tons)"
    ) +
    theme_minimal()  # Use a minimal theme for a clean look

# Close the PNG device
dev.off()
