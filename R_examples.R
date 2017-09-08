#this file contains the draft for the needed 
#R code in the actual notebook

#may be removed or ignored

library(jsonlite)
library(dplyr)
library(tidyr)
library(ggplot2)


df <- fromJSON("http://api.vipunen.fi/api/resources/suorittanut55/data")
raw <- fromJSON("http://api.vipunen.fi/api/resources/suorittanut55/data",FALSE)

df %>% 
  filter(oppilaitos %in% c("Metropolia Ammattikorkeakoulu",
                           "Lahden ammattikorkeakoulu"),
         vuosi==2016) %>% 
  ggplot() +
  geom_bar(aes(okmOhjauksenAla,weight=suorittanut55,fill=oppilaitos),position="dodge") +
  coord_flip()

df %>%
  mutate(vuosi=factor(vuosi)) %>% 
  filter(oppilaitos == "Lappeenrannan teknillinen yliopisto") %>% 
  ggplot() +
  geom_bar(aes(vuosi,weight=suorittanut55)) +
  coord_flip()


#------------------

df <- fromJSON("http://api.vipunen.fi/api/resources/ytl_arvosanat/data")
raw <- fromJSON("http://api.vipunen.fi/api/resources/ytl_arvosanat/data",FALSE)

df17K <- df %>% 
  mutate(arvosanapisteet=as.numeric(arvosanapisteet)) %>% 
  filter(tutkintokertaKoodi=="2017K")
  
df %>% select(arvosanapisteet) %>% summary()
  
df %>% filter(koe=="Englanti, pitkä oppimäärä") %>% 
    ggplot() + geom_histogram(aes(arvosanapisteet),binwidth = 1) +
  facet_grid(~opetuskieli)




