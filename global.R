nbmc <- read.csv("./data/NBMC.csv")
nbmc <- nbmc[!duplicated(nbmc[c('state','city')]), ]

zip_coords <- read.csv("./data/zip_codes_states.csv")

station_data <- merge(nbmc, zip_coords, by=c('state','city'))
station_data <- station_data[!duplicated(station_data[c('state','city','Call.Letter')]), ]

