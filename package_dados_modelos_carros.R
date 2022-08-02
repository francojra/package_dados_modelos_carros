# Base de dados - Curso R ------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 02/08/22 ---------------------------------------------------------------------------------------------------------------------------

# Carregar pacotes --------------------------------------------------------------------------------------------------------------------------

library(tidyverse)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

mod_carro <- dados::comuns
view(mod_carro)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

mod_carro1 <- mod_carro %>%
  group_by(marca) %>%
  summarise(media = mean(total_modelos),
            sd = sd(total_modelos),
            n = n(),
            se = sd/sqrt(n))
mod_carro1

mod_carro2 <- mod_carro %>%
  group_by(marca) %>%
  summarise(media = mean(total_modelos_ano),
            sd = sd(total_modelos_ano),
            n = n(),
            se = sd/sqrt(n))
mod_carro2

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

g1 <- ggplot(mod_carro1, aes(x = fct_reorder(marca, media), 
                             y = media)) +
  geom_col(fill = "#756bb1") +
  geom_errorbar(aes(x = marca, y = media,
                    ymin = media - se,
                    ymax = media + se),
                width = 0.3, size = 0.6) +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  coord_flip() +
  labs(x = "Marcas de carro", y = "Número médio de modelos")
g1
