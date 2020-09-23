FROM rocker/verse
MAINTAINER Zhuofu Wang <Zhuofu@ad.unc.edu>
RUN R -e "install.packages('xlsx')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('caret')" 
Run R -e "install.packages('tidyverse')"