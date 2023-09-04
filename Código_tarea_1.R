install.packages("Tidyverse")
library(tidyverse)

### Genero algúna variable y grafico

rm(list=ls())

x = rnorm(1000, 15, 5)
y = rnorm(1000, 8, 4)

plot1 <- hist(x)
plot2 <- hist(y)

plot3 <- plot(x,y, type = "l")
