FROM rocker/verse
MAINTAINER Zhuofu Wang <zhuofu@ad.unc.edu>
RUN R -e "install.packages('xlsx')"
RUN R -e "install.packages('gbm')"