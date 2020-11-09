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

## report 
1. 20 pts: Does the Shiny project run from the Makefile and make appropriateuse of other artifacts in the repository?

Yes, just simply type "PORT=8788 make app" in the Rstuio terminal and the shiny project will run. Data pre-processing is also expressed as a dependency in the Makefile. 

2. 20 pts: Are there instructions in the README that tell a user how to start the Shiny application?

The instructions to start the Shiny application is stated above. Just follow the step and you will be fine. 

3. 20 pts: Does the RShiny app allow the user to understand something that
   would be hard to understand with a static visualization? Are the
   visualizations well chosen?
   
One advtange of interative visualization is that An interactive Visualization helps you determine what the data is telling you. My Rshiny app allows the user to explore the level of engagement of trending videos across different categories on YouTube. Users can get a general feel for how much engagement is usually required to get a trending video by selecting different options: "Views", "Likes", "Dislikes" and "Comment Count".


