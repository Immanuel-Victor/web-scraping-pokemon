# Instala os pacotes que vamos usar nesse script
install.packages(c("netstat","RSelenium","tidyverse", "rvest", "stringr", "LSAfun", "lubridate"))

# Carrega os pacotes para uso

Packages <- c("netstat","RSelenium","tidyverse", "rvest", "stringr", "LSAfun", "lubridate")
lapply(Packages, library, character.only = TRUE)

# Começo do Script -----------------------------------------------------------------------------------------------------------------------------------

#Usando firefox por que o Chrome acabou não funcionando
rs_driver_object<- rsDriver(
  browser = "firefox",
  geckover = "0.31.0",
  verbose = F,
)
#Use rsDriver() para usar o chrome como padrão ou rsDriver(browser = "internet explorer") para o internet explorer

remDr <- rs_driver_object$client

remDr$open()
remDr$navigate("https://www.pokemon.com/br/pokedex/")
remDr$maxWindowSize()

remDr$findElement(using = 'link text', "Carregar mais Pokémon")$clickElement()
