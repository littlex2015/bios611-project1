library(pacman)
p_load(tidyverse, data.table, jsonlite, magrittr, corrplot, DT, tm, sentimentr, wordcloud)
# Loading the CSV documents and removing unnecessary columns to make the database easier to work with 
US <- read.csv("source_data/USvideos.csv") %>% 
  select(-tags, -description, -video_id)
id <- read_json("source_data/US_category_id.json", simplifyVector = FALSE)

id_df <- data.frame(id_numers = c(),
                    labels = c())
for(i in seq_along(id[[3]])){
  id_df[i, 'id_numbers'] <- id[[3]][[i]][[3]]
  id_df[i, 'labels'] <- id[[3]][[i]][[4]][[2]]
}

# category_id from numeric to factor
US$category_id %<>% factor()

# And join both databases
US2 <- US %>% 
  left_join(id_df, by = c('category_id' = 'id_numbers')) 

# Reorder label plot
US2 <- within(US2, labels <- factor(labels, levels = names(sort(table(labels), decreasing = TRUE))))

# Clean publish_time and convert into POSIX
trim <- gsub('[TZ]', ' ', US2$publish_time)
US2$publish_time <- substr(trim, 1, nchar(trim) - 5)
US2$publish_time <- as.POSIXct(US2$publish_time)

# Create date
US2$date <- as.Date(US2$publish_time)

# Remove items before November 2017
US2  %<>%
  filter(date > as.Date('2017-11-01'))

# By category analysis
my_theme <- theme(plot.title = element_text(size = 20),
                  axis.title = element_blank(),
                  axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 10),
                  axis.text.y = element_text(size = 10),
                  legend.text = element_text(size = 12),
                  legend.title = element_blank())

# barplot of the most frequent categories
video_cate = US2 %>%
  ggplot(aes(x = labels, fill = labels))  +
  geom_bar() + 
  geom_text(stat='count', aes(y=..count.., label = ..count..), vjust = -1) +
  theme_bw() + 
  my_theme +
  ggtitle('Video Categories by Frequency')
ggsave(file="images/VideoCategories_fre.png", width=10, height=5, dpi=300,video_cate)

Num_views= ggplot(US2, aes(views, fill = labels)) +
  geom_histogram(bins = 20) +
  scale_x_log10() + 
  theme_bw() + 
  labs(x = 'Views', y = '', fill = '') +
  theme(plot.title = element_text(size = 20),
        legend.text = element_text(size = 12)) +
  facet_wrap(~ labels, scale = 'free_y') +
  ggtitle("Number of views per category")
ggsave(file="images/Num_views.png", width=10, height=5, dpi=300,Num_views)

US2  %<>% 
  mutate(like_ratio = likes / (likes + dislikes))
# Like/Dislike ratio boxplot
like_dislike = US2 %>% 
  ggplot(aes(labels, like_ratio, col = labels)) +
  geom_boxplot(na.rm=TRUE) +
  ggtitle('Like/Dislike ratio per category - Boxplot') +
  theme_bw() +
  my_theme
ggsave(file="images/like_dislike.png", width=10, height=5, dpi=300,like_dislike)

views2m = US2  %>% 
  filter(views > 2000000) %>% 
  ggplot(aes(x = labels, views, col = labels)) +
  geom_jitter(alpha = .3) +
  ggtitle('Videos with over 2M views') +
  theme_bw() +
  my_theme
ggsave(file="images/views2m.png", width=10, height=5, dpi=300,views2m)




