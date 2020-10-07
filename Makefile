.PHONY: clean
SHELL: /bin/bash

clean:
	rm derived_data/*
  
report.pdf:\
 report.md\
 figures/comparison_of_heights_and_weights.png
	Rscript -e "rmarkdown::render('report.Rmd',output_format='pdf_document')"
	mkdir -p tagged_reports/
	cp report.pdf tagged_reports/`git log -1 | head -n 1| cut -d' ' -f2`-report.pdf
	
images/VideoCategories_fre.png\
 images/Num_views.png\
 images/like_dislike.png\
 images/views2m.png:\
 Report_Figures.R\
 source_data/USvideos.csv\
 source_data/US_category_id.json
	Rscript Report_Figures.R

images/timepasses.png\
 images/view_comment.png:\
 Preliminary Figures.R\
 source_data/GBvideos.csv\
 source_data/FRvideos.csv\
 source_data/CAvideos.csv\
 source_data/USvideos.csv\
 source_data/DEvideos.csv
	Rscript Preliminary Figures.R
	
	