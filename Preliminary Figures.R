library("data.table")

gb <- tail(fread("source_data/GBvideos.csv",encoding = "UTF-8"),20000)

gb[,"Location":="GB"]

fr <- tail(fread("../input/FRvideos.csv",encoding = "UTF-8"),20000)

fr[,"Location":="FR"]

ca <- tail(fread("../input/CAvideos.csv",encoding = "UTF-8"),20000)

ca[,"Location":="CA"]

us <- tail(fread("../input/USvideos.csv",encoding = "UTF-8"),20000)

us[,"Location":="US"]

de <- tail(fread("../input/DEvideos.csv",encoding = "UTF-8"),20000)

de[,"Location":="DE"]



videos <- as.data.table(rbind(gb,fr,ca,us,de))

videos$trending_date <- ydm(videos$trending_date)

videos$publish_time <- ymd(substr(videos$publish_time,start = 1,stop = 10))

videos$dif_days <- videos$trending_date-videos$publish_time
