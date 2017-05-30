library(devtools)
install_github('terraref/traits')

install_github('daattali/addinslist')

lapply(c('doc', 'src', 'results', 'data'), dir.create)      

library(readr)
salix <- read_csv("https://betydb.org/search.csv?search=salix",
                  col_types = cols(author = col_skip(),
                                   city = col_skip()), 
                  comment = "#",
                  skip = 2)
write_csv(salix, path = 'data/salix.csv')

# for loop

for(i in 1:10){
  #whatever you want to do 10 times
  print(paste('I am on iteration', i))
}
library(readr)
for(genus in c('panicum', 'miscanthus', 'populus')){
  #read in data for genus
  url <- paste0('https://betydb.org/search.csv?search=', genus)
  tmp_data <- read_csv(url,
                       col_types = cols(author = col_skip(),
                                        city = col_skip()), 
                       comment = "#",
                       skip = 2)
  #write to file data/[genus].csv
  filename <- paste0('data/', genus, ".csv")
  write_csv(tmp_data, path = filename)
}

## as a function
#' Title
#'
#' @param genus name of genus to query  
#'
#' @return dataframe
#' @export
#'
#' @examples 
#' read_bety_genus('salix')
read_bety_genus <- function(genus){
  url <- paste0('https://betydb.org/search.csv?search=', genus)
  tmp_data <- readr::read_csv(url,
                       col_types = cols(author = col_skip(),
                                        city = col_skip()), 
                       comment = "#",
                       skip = 2)
  #write to file data/[genus].csv
  filename <- paste0('data/', genus, ".csv")
  readr::write_csv(tmp_data, path = filename)
}
for(genus in c('panicum', 'miscanthus', 'populus')) {
  read_bety_genus(genus)
}

genera <- c('salix', 'panicum', 'miscanthus', 'populus')
lapply(genera, read_bety_genus)