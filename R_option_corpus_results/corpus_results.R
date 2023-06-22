

install.packages('tidyverse')
install.packages("officer")    # for working with Microsoft Word

library(tidyverse)
library(officer)

columns <- c('Data', 'MODEL', 'TOKEN', 'WORDS', 'UPOS', 'LEMMA', 'FEAT',
             'UAS', 'LAS')
MODEL <- c('ar-mr', 'ar-padt', 'ar-nyuad', 'ar-narabizi', 'fr-gsd', 'mr+padt',
          'mr+nyuad', 'mr+narabizi', 'mr+gsd')

#dev evaluation results
TOKEN_test <- c(100.00, 100.00, 100.00, 100.00, 85.71, 100.00, 100.00, 100.00, 98.14)
MWT_test <- c(61.14, 86.11, 88.89, 56.84, 50.00, 87.04, 89.81, 61.14, 65.70)
LEMMA_test <- c(44.55, 27.27, 4.55, 4.55, 4.55, 38.18, 19.09, 45.45, 44.55)
UPOS_test <- c(73.64, 44.55, 48.18, 30.00, 0.91, 52.73, 50.91, 46.36, 17.27)
UFEAT_test <- c(50.91, 30.00, 18.18, 30.00, 27.27, 30.00, 18.18, 26.36, 22.73)
UAS_test <- c(75.45, 48.18, 54.55, 54.55, 56.36, 57.27, 61.82, 51.82, 44.55)
LAS_test <- c(50.91, 18.18, 22.73, 15.45, 20.00, 28.18, 29.09, 5.45, 16.36)


test_results <- tibble (MODEL, TOKEN_test, MWT_test, LEMMA_test, UPOS_test, UFEAT_test, UAS_test, LAS_test)

test_results

#exclude GSD results as French does not provide good results
row_to_exclude <- c(5,9)
test_results_excluded <- test_results[-row_to_exclude, ]
test_results_excluded

#print dev results for MWTS
MWT_dev <- c(99.90, 99.04, )


#create word file for the table
doc <- read_docx()
doc <- doc %>%
  body_add_table(value = results)
print(doc, target = "/Users/yiminglu/Desktop/results.docx")
