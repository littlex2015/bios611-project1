library(ggplot2)
library(dplyr)
library(hexbin)

# Preview the data
diamonds_subset = sample_n(diamonds, 1000, replace=FALSE)
diamonds


d <- ggplot(diamonds_subset, aes(x = carat, y = price))+geom_point()
d
d1 <- ggplot(diamonds_subset, aes(x=carat, y=price)) +
  geom_hex()
d1
d2 <- ggplot(diamonds_subset, aes(x=carat, y=price)) +
  geom_bin2d()
d2
d3 <- ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point() +
  geom_rug(alpha=0.3)
d3
d4 <- ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point() +
  geom_smooth()
d4
d5 = ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point(size=4, color='red') +
  geom_smooth()
d5
d6 = ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point(size=4, alpha=0.2) +
  geom_smooth(size=3)
d6
d7 = ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point(size=4, aes(shape=cut)) +
  geom_smooth() +
  theme_bw()
d7
d8 <- ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point(size=4, aes(color=cut, shape=color)) +
  geom_smooth()
d8
d9 <- ggplot(diamonds_subset,aes(x=carat, y=price)) +
  geom_point(size=4) + facet_wrap(~cut)
d9
d10 <- ggplot(diamonds_subset,aes(x=price)) +
  geom_histogram()
d10
d11 <- ggplot(diamonds_subset,aes(x=cut, y=price)) +
  geom_boxplot()
d11
d12 <- ggplot(diamonds_subset,aes(x=price)) +
  geom_histogram() +
  xlab('Price in US Dollars') +
  ylab('Count') +
  ggtitle('Distribution of Diamond Prices')
d12
#or
d12 <- ggplot(diamonds_subset,aes(x=price))+geom_histogram()+
  labs(x = 'price',
      y = 'count',
      title = 'distribution')
ggsave('diamond_example.png',d9)
