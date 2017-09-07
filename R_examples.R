library(jsonlite)
library(dplyr)
library(ggplot2)


raw <- fromJSON("http://api.vipunen.fi/api/resources/suorittanut55/data")

raw %>% 
  filter(oppilaitos %in% c("Metropolia Ammattikorkeakoulu",
                           "Lahden ammattikorkeakoulu")) %>% 
  ggplot() +
  geom_bar(aes(okmOhjauksenAla,weight=suorittanut55,fill=oppilaitos),position="dodge") +
  coord_flip()
  
raw %>%
  filter(oppilaitos == "Lappeenrannan teknillinen yliopisto") %>% 
  ggplot() +
  geom_bar(aes(factor(vuosi))) +
  coord_flip()
