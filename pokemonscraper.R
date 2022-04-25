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

Sys.sleep(15)

remDr$findElement(using = 'link text', "Carregar mais Pokémon")$clickElement()

for(i in 1:2){
for(i in 1:50){
remDr$executeScript('window.scrollTo(0, document.body.scrollHeight);')
Sys.sleep(3)
}
  }

info_pokemon <- remDr$findElements(using = 'xpath', '//div[@class="pokemon-info"]')

todos_pokemons <- lapply(info_pokemon, function(textos) {
  textos$getElementText() %>% unlist()
}) %>% flatten_chr()
write.csv(todos_pokemons, "Pokémons.csv")

