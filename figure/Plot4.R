# Load necessary library
library(utils)  # For downloading and extracting data files

# Load the data file
NEI <- readRDS("summarySCC_PM25.rds")

# Aggregate total emissions by year in the United States
total_emissions_by_year <- aggregate(Emissions ~ year, data = NEI, sum)

# Create the plot and save it as a PNG file
png(filename = "plot1.png", width = 480, height = 480, res = 100)  # Open PNG device

# Plot total PM2.5 emissions by year
plot(
    total_emissions_by_year$year,
    total_emissions_by_year$Emissions,
    type = "b",  # Both points and lines
    pch = 19,  # Point shape (solid circle)
    col = "blue",  # Color of the plot (points and lines)
    xlab = "Year",  # X-axis label
    ylab = "Total PM2.5 Emissions (tons)",  # Y-axis label
    main = "Total PM2.5 Emissions by Year in the U.S.",  # Plot title
    lty = 1,  # Line type (solid)
    lwd = 1.5  # Line width
)

# Close the PNG device
dev.off()
