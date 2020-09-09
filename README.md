## Project 1 Bios 611
***
### Loan Applicants Dataset
***
### Proposal 
***
#### Introduction 
Banks play a crucial role in market economies. They decide who can get finance and on what terms and can make or break investment decisions. For markets and society to function, individuals and companies need access to credit. 

Firstly, I need to figure out which variables is the most important variable that can determine if a customer is good or bad. Can we see biases related to Person experienced 90 days past due delinquency or worse in datasets? Is the age variable impact the credibility of the applicants? What characteristics do a bad/good applicant have?

Credit scoring algorithms, which make a guess at the probability of default, are the method banks use to determine whether or not a loan should be granted. My final task is to improve on the state of the art in credit scoring, by predicting the probability that somebody will experience financial distress in the next two years.The final deliverable is a model that borrowers can use to help make the best financial decisions.


#### Datasets 
The datasets we undertake to analyze are publicly available on Kaggle and cover loan applicants financial information and other personal information. They can be downloaded.This repo will eventually contain an analysis of the loan applicants financial information Dataset.

Information provided by Kaggle on variables in the data set are given below:

| Variable Name                        | Description                                                                                                                                              | Type       |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| SeriousDlqin2yrs                     | Person experienced 90 days past due delinquency or worse                                                                                                 | Y/N        |
| RevolvingUtilizationOfUnsecuredLines | Total balance on credit cards and personal lines of credit except real estate and no installment debt like car loans divided by the sum of credit limits | percentage |
| age                                  | Age of borrower in years                                                                                                                                 | integer    |
| NumberOfTime30-59DaysPastDueNotWorse | Number of times borrower has been 30-59 days past due but no worse in the last 2 years.                                                                  | integer    |
| DebtRatio                            | Monthly debt payments, alimony,living costs divided by monthy gross income                                                                               | percentage |
| MonthlyIncome                        | Monthly income                                                                                                                                           | real       |
| NumberOfOpenCreditLinesAndLoans      | Number of Open loans (installment like car loan or mortgage) and Lines of credit (e.g. credit cards)                                                     | integer    |
| NumberOfTimes90DaysLate              | Number of times borrower has been 90 days or more past due.                                                                                              | integer    |
| NumberRealEstateLoansOrLines         | Number of mortgage and real estate loans including home equity lines of credit                                                                           | integer    |
| NumberOfTime60-89DaysPastDueNotWorse | Number of times borrower has been 60-89 days past due but no worse in the last 2 years.                                                                  | integer    |
| NumberOfDependents                   | Number of dependents in family excluding themselves (spouse, children etc.)                                                                              | integer    |
#### Preliminary Figures
<img src="images/monthlyincome vs age with SeriousDlqin2yrs.png">

#### Usage
You'll need Docker and the ability to run Docker as your current user.

You'll need to build the container:

> docker build . -t project1-env

This Docker container is based on rocker/verse. To run rstudio server:

> docker run -v `pwd`:/home/rstudio -p 8787:8787\
  -e PASSWORD=mypassword -t project1-env

Then connect to the machine on port 8787.

If you are cool and you want to run this on the command line:

> docker run -v `pwd`:/home/rstudio -e PASSWORD=some_pw -it l6 sudo -H -u rstudio /bin/bash -c "cd ~/; R"

Or to run Bash:

> docker run -v `pwd`:/home/rstudio -e PASSWORD=some_pw -it l6 sudo -H -u rstudio /bin/bash -c "cd ~/; /bin/bash"