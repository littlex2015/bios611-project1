FROM rocker/verse
MAINTAINER Zhuofu Wang <zhuofu@ad.unc.edu>
RUN adduser rstudio sudo
RUN R -e "install.packages(c('shiny','plotly'))";
RUN R -e "install.packages(c('jsonlite','listviewer'))";
RUN R -e "install.packages(c('lubridate','scales'))";
RUN R -e "install.packages(c('shinydashboard','tidyverse'))";
RUN R -e "install.packages('tidytext')";


