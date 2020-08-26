FROM rocker/verse
MAINTAINER Zhuofu Wang <wwang2015@gmail.comOB>
RUN R -e "install.packages('xlsx')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('caret')" 
