# Instala os pacotes que vamos usar nesse script
install.packages(c("RSelenium","tidyverse", "rvest", "stringr", "LSAfun", "lubridate"))

# Carrega os pacotes para uso

Packages <- c("RSelenium","tidyverse", "rvest", "stringr", "LSAfun", "lubridate")
lapply(Packages, library, character.only = TRUE)

# Começo do Script -----------------------------------------------------------------------------------------------------------------------------------

RSelenium::rsDriver(browser = "firefox")

