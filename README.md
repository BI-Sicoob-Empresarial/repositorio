# repositorio

library(tidyverse)

data = get.url("www.pedraotop.com.br")

data = data %>% filter(nome == 'pedro')
