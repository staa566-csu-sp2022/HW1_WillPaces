library(ggplot2)
library(carat)
library(rpart)

# Import data, "simplify" feature space
data <- iris
data$Sepal.Size <- data$Sepal.Length * data$Sepal.Width
data$Petal.Size <- data$Petal.Length * data$Petal.Width

# Generate classification tree
dt_model <- rpart(Species ~ Sepal.Size + Petal.Size, data = data)

# Print tree structure to tiff
tiff("C:\\Users\\Will\\Desktop\\STAA 566\\AssignmentGitRepos\\STAA_566_HW1_WP\\DecisionTree_Model.tif", height = 4,
     width = 4, units = 'in', res = 300)
par(xpd = NA)
plot(dt_model)
text(dt_model, digits = 3)
dev.off()

# Generate Iris scatter plot
g <- ggplot(data = data, aes(x = Petal.Size, y = Sepal.Size, colour = Species))
g <- g + geom_point()
g <- g + geom_vline(xintercept = 2.13, colour = 'salmon', size = 1.5)
g <- g + geom_vline(xintercept = 7.425, colour = 'aquamarine3', size = 1.5)
g <- g + xlab("Petal Size") + ylab("Sepal Size") + ggtitle("Iris Species Classification by Petal and Sepal Size")
g$labels$colour <- "Iris Species"

tiff("C:\\Users\\Will\\Desktop\\STAA 566\\AssignmentGitRepos\\STAA_566_HW1_WP\\Iris_Species_Plot.tiff")
plot(g)
dev.off()
