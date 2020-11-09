.PHONY: app
.PHONY: clean

clean:
	rm derived_data/*.csv
	
derived_data/clean_df.rds: clean.R\
 ./source_data/US_category_id.json\
 ./source_data/USvideos.csv
	Rscript clean.R 
	
app: derived_data/clean_df.rds
	Rscript app.R ${PORT}