# Instala os pacotes que vamos usar nesse script
install.packages(c("tidyverse", "rvest", "stringr", "LSAfun", "lubridate"))

# Carrega os pacotes para uso

Packages <- c("tidyverse", "rvest", "stringr", "LSAfun", "lubridate")
lapply(Packages, library, character.only = TRUE)

# Começo do Script -----------------------------------------------------------------------------------------------------------------------------------

pokedex-website <- read_html("https://www.pokemon.com/br/pokedex/")

