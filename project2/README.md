You'll need Docker and the ability to run Docker as your current user.

You'll need to build the container:

    docker build . -t 3.env

To run RSS this say:

    docker run -v `pwd`:/home/rstudio -e PASSWORD=531010 -p 8787:8787 -p 8788:8788 -t 3.env
    
To run the shiny app, go to the terminal in RStudio and run

    PORT=8788 make app

then go to a browser and run
    http://localhost:8788/
    
If you want to run the shiny app on another port, replace 8788 above
(in all places) with the appropriate port.


