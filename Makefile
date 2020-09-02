.PHONY: clean

clean:
	rm derived_data/*
  
derived_data/cs-training.csv:\
 source_data/cs-training.csv\
 tidy_data.R
	Rscript tidy_data.R