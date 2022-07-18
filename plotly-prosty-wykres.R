library(readr)
bestsellers<- read_csv("MATLAB/archive/bestsellers_with_categories_2022_03_27.csv")
View(bestsellers)
library(dplyr)
library(plotly)
tab <-bestsellers %>% 
  group_by(Author) %>% 
  summarise(ile = n()) %>% 
  arrange(-ile) %>% 
  head(10) %>% 
  left_join(bestsellers, by = 'Author')
plot_ly(
  data = tab,
  x=~Price,
  y=~Reviews,
  color=~Author,
  colors = c('lightgreen', 'lightblue', 'darkred', 'darkblue', 'yellow', 'brown', 'darkgreen', 'grey', 'black','orange'),
  type = "scatter",
  marker = list(size = 8)
) %>% 
  layout(title="Correlation between price and review<br><sup>by Authors</sup>")

library(readr)
house_data <- read_csv("Szkola/Kuba/Studia/rstudio/house_data.csv")
View(house_data)


?plotlyOutput


plot_ly(x = ~rnorm(50), type = "histogram")

X <- data.frame()
for (m in seq(-5, 5, 1)) {
  new_X <- data.frame(
    value = rnorm(100, m), 
    mean = m
  )
  X <- rbind(X, new_X)
}

fig <- plot_ly(data = X, x = ~value, frame = ~mean, type = "histogram")
fig

fig %>% 
  animation_opts(10) %>%
  animation_button(x = 0.05, y = 0.05) %>%
  animation_slider(currentvalue = list(prefix = "MEAN: ", font = list(color="red")))

?group_by
