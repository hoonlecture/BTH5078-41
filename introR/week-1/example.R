```
#' If not exist, install, and then load package
if (!require(viridis)) install.packages('viridis')
library(viridis)

if (!require(ggplot2)) install.packages('ggplot2')
library(ggplot2)


#' The code below deomostrates two color paletters in the [viridis](https://github.com/sjmgarier/viridis) package. 
#' Each plot displayes a contour map of the Mounga Wau volcano in Auckland, New Zealand.

#' Viridis colors
image(volcano, col = viridis(200))


#' Magma colors
image(volcano, col = viridis(200, option = "A"))

#' examples using ggplot
print(head(mpg))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size =class))
  
```
