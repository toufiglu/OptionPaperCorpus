tab <- matrix(c(7, 5, 14, 19, 3, 2, 17, 6, 12), ncol=3, byrow=TRUE)
colnames(tab) <- c('colName1','colName2','colName3')
rownames(tab) <- c('rowName1','rowName2','rowName3')
tab <- as.table(tab)
print(tab)


install.packages('tidyverse')
install.packages("officer")    # for working with Microsoft Word

library(tidyverse)
library(officer)

columns <- c('Data', 'MODEL', 'TOKEN', 'SENT', 'WORDS', 'UPOS', 'LEMMA', 'FEAT',
             'UAS', 'LAS')
MODEL <- c('ar-mr', 'ar-padt', 'ar-nyuad', 'ar-narabizi', 'mr+padt',
          'mr+nyuad', 'mr+narabizi')


TOKEN <- c(100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00)
MWT <- c(61.14, 86.11, 88.89, 56.84, 87.04, 89.81, 61.14)
LEMMA <- c(44.55, 27.27, 4.55, 4.55, 38.18, 19.09, 45.45)
UPOS <- c(73.64, 44.55, 48.18, 30.00, 52.73, 50.91, 46.36)
UFEAT <- c(50.91, 30.00, 18.18, 30.00, 30.00, 18.18, 26.36)
UAS <- c(75.45, 48.18, 54.55, 54.55, 57.27, 61.82, 51.82)
LAS <- c(50.91, 18.18, 22.73, 15.45, 28.18, 29.09, 5.45)


results <- tibble (MODEL, TOKEN, MWT, LEMMA, UPOS, UFEAT, UAS, LAS)

results

monoresults <- head(results, n=4)
monoresults

doc <- read_docx()
doc <- doc %>%
  body_add_table(value = results)
print(doc, target = "/Users/yiminglu/Desktop/results.docx")


doc <- read_docx()
doc <- doc %>%
  body_add_table(value = monoresults)
print(doc, target = "/Users/yiminglu/Desktop/monoresults.docx")


MWT_dev <- c(99.90, 99.04, 99.77, 91.59, 99.09, 99.77, 94.25)
MWT_test <- c(61.14, 86.11, 88.89, 56.84, 87.04, 89.81, 61.14)
compareMWV <- tibble (MODEL, MWT_dev, MWT_test)
compareMWV
