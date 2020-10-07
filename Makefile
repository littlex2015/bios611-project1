.PHONY: clean
SHELL: /bin/bash

clean:
	rm derived_data/*
  
Report.pdf:\
 Report.Rmd\
 images/VideoCategories_fre.rds\
 images/Num_views.rds\
 images/like_dislike.rds\
 images/views2m.rds\
 images/timepasses.rds
	Rscript -e "rmarkdown::render('Report.Rmd',output_format='pdf_document')"

	
images/VideoCategories_fre.rds\
 images/Num_views.rds\
 images/like_dislike.rds\
 images/views2m.rds:\
 Report_Figures.R\
 source_data/USvideos.csv\
 source_data/US_category_id.json
	Rscript Report_Figures.R
	
images/timepasses.rds images/view_comment.rds:\
 Preliminary Figures.R\
 source_data/GBvideos.csv\
 source_data/FRvideos.csv\
 source_data/CAvideos.csv\
 source_data/USvideos.csv\
 source_data/DEvideos.csv
	Rscript Preliminary Figures.R

	
	