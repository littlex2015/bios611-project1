FROM rocker/verse
MAINTAINER Zhuofu Wang <Zhuofu@ad.unc.edu>
RUN R -e "install.packages('xlsx')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('caret')" 
Run R -e "install.packages('tidyverse')"
Run R -e "install.packages('data.table')"
Run R -e "install.packages('DT')"
Run R -e "install.packages('lubridate')"
Run R -e "install.packages('wordcloud')"
Run R -e "install.packages('stringr')"
Run R -e "install.packages('tidyverse')"

RUN apt update && apt-get install emacs
