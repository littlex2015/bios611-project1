library("data.table")
library(lubridate)
library(corrplot)
library(ggplot2)
library(dplyr)
library(hexbin)
library(ggrepel)
my_theme <- theme(plot.title = element_text(size = 20),
                  axis.title = element_blank(),
                  axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 10),
                  axis.text.y = element_text(size = 10),
                  legend.text = element_text(size = 12),
                  legend.title = element_blank())
gb <- tail(fread("source_data/GBvideos.csv",encoding = "UTF-8"),20000)

gb[,"Location":="GB"]
head(gb)
fr <- tail(fread("source_data/FRvideos.csv",encoding = "UTF-8"),20000)

fr[,"Location":="FR"]

ca <- tail(fread("source_data/CAvideos.csv",encoding = "UTF-8"),20000)

ca[,"Location":="CA"]

us <- tail(fread("source_data/USvideos.csv",encoding = "UTF-8"),20000)

us[,"Location":="US"]

de <- tail(fread("source_data/DEvideos.csv",encoding = "UTF-8"),20000)

de[,"Location":="DE"]



videos <- as.data.table(rbind(gb,fr,ca,us,de))

videos$trending_date <- ydm(videos$trending_date)

videos$publish_time <- ymd(substr(videos$publish_time,start = 1,stop = 10))

videos$dif_days <- videos$trending_date-videos$publish_time

correlation = corrplot.mixed(corr = cor(videos[,c("category_id","views","likes","dislikes","comment_count"),with=F]))

timepasses = ggplot(videos[dif_days<30],
                    aes(as.factor(dif_days),fill=as.factor(dif_days)))
+geom_bar()+guides(fill="none")
+labs(title=" Time between published and trending",subtitle="In days")+xlab(NULL)+ylab(NULL)
+ my_theme
ggsave(file="images/timepasses.png", width=10, height=5, dpi=300,view_comment)

view_comment= ggplot(videos[,.("comment_count"=max(comment_count),"likes"=max(likes)),by=title],aes(comment_count,likes,colour=likes,size=likes))+
  geom_jitter()+geom_smooth()+guides(fill="none")+labs(caption="Donyoe",title="Views Vs Comment",subtitle="In days")+
  
  my_theme+geom_text_repel(data=subset(videos[,.("comment_count"=max(comment_count),"likes"=max(likes)),by=title], likes > 1e+06),
                                                  
                                                  aes(comment_count,likes,label=''),check_overlap=T)
ggsave(file="images/view_comment.png", width=10, height=5, dpi=300,view_comment)
