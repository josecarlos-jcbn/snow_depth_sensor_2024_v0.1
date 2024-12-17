# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #    
#         Autores: José Carlos Barbosa Neto & Ricardo Potozky de Oliveira                 # 
# CÓDIGOS DAS FERRAMENTAS ESTATÍSTICAS PARA A DISCIPLINA DE SENSORES E MICROCONTROLADORES # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#instalando os pacotes readxl e tidyverse

install.packages("readxl")
library(readxl)

install.packages("tidyverse")
library(tidyverse)

#importando os dados do experimento 1

dados1 <- read.csv("dados1.csv")
View(dados1)

#gerando o boxplot dos dados1

boxplot1 <- dados1 |> 
  ggplot(aes(x = Tempo, y = Profundidade)) +
  geom_boxplot(color = "#4292b5") + 
  theme(
    panel.background = element_rect(
      fill = "white",
      colour = "white"
    ),
    panel.grid.major = element_line(
      colour = "#e8e9ed"
    )
  ) + 
  ggtitle(
    "Boxplot 1 - Experimento 1",
    subtitle = "Variável: Profundidade"
  )
boxplot1

#salvando o boxplot1

ggsave(
  filename = "Boxplot1.png",
  plot = boxplot1,
  device = "png",
  dpi = 300,
  width = 3000,
  height = 1500,
  units = "px"
)

#importando os dados do experimento 2

dados2 <- read.csv("dados2.csv")
View(dados2)

#gerando o boxplot dos dados1

boxplot2 <- dados2 |> 
  ggplot(aes(x = Tempo, y = Profundidade)) +
  geom_boxplot(color = "#4292b5") + 
  theme(
    panel.background = element_rect(
      fill = "white",
      colour = "white"
    ),
    panel.grid.major = element_line(
      colour = "#e8e9ed"
    )
  ) + 
  ggtitle(
    "Boxplot 2 - Experimento 2",
    subtitle = "Variável: Profundidade"
  )
boxplot2

#salvando o boxplot2

ggsave(
  filename = "Boxplot2.png",
  plot = boxplot2,
  device = "png",
  dpi = 300,
  width = 3000,
  height = 1500,
  units = "px"
)

#importando os dados do experimento 3

dados3 <- read.csv("dados3.csv")
View(dados3)

#gerando o boxplot dos dados3

boxplot3 <- dados |> 
  ggplot(aes(x = Tempo, y = Profundidade)) +
  geom_boxplot(color = "#4292b5") + 
  theme(
    panel.background = element_rect(
      fill = "white",
      colour = "white"
    ),
    panel.grid.major = element_line(
      colour = "#e8e9ed"
    )
  ) + 
  ggtitle(
    "Boxplot 3 - Experimento 3",
    subtitle = "Variável: Profundidade"
  )
boxplot3

#salvando o boxplot3

ggsave(
  filename = "Boxplot3.png",
  plot = boxplot3,
  device = "png",
  dpi = 300,
  width = 3000,
  height = 1500,
  units = "px"
)

#série temporal da temperatura real para o experimento 1

serie1 <- read.csv('dados1_tempreal.csv')
View(serie1)

plot.ts(serie1)
temp_real1 <- plot.ts(serie1$Temperatura.Real)

temp_real1 <- plot(serie1, type = "l", 
     lwd = 2,
     col = "blue",
     main = "Série Temporal do Experimento 1 - Temperatura Real", 
     xlab = "Unidade de Tempo",
     ylab = "Temperatura Real")

#salvando a série temporal da real_temp 1 por export

#série temporal da temperatura modificada para o experimento 1

serie2 <- read.csv('dados1_tempmod.csv')
View(serie2)

plot.ts(serie2)
temp_mod1 <- plot.ts(serie2$Temp.Mod.)

temp_mod1 <- plot(serie1, type = "l", 
                   lwd = 2,
                   col = "blue",
                   main = "Série Temporal do Experimento 1 - Temperatura Modificada", 
                   xlab = "Unidade de Tempo",
                   ylab = "Temperatura Modificada")

#salvando a série temporal da temp_mod1 por export

#série temporal da pressão para o experimento 1

serie3 <- read.csv('dados1_pres.csv')
View(serie3)

plot.ts(serie3)
pres1 <- plot.ts(serie3$Pressão)

pres1 <- plot(serie3, type = "l", 
                  lwd = 2,
                  col = "blue",
                  main = "Série Temporal do Experimento 1 - Pressão", 
                  xlab = "Unidade de Tempo",
                  ylab = "Pressão")

#salvando a série temporal da pres1 por export

#série temporal da altitude para o experimento 1

serie4 <- read.csv('dados1_alt.csv')
View(serie4)

plot.ts(serie4)
alt1 <- plot.ts(serie4$Altitude)

alt1 <- plot(serie4, type = "l", 
              lwd = 2,
              col = "blue",
              main = "Série Temporal do Experimento 1 - Altitude", 
              xlab = "Unidade de Tempo",
              ylab = "Altitude")

#salvando a série temporal da alt1 por export

#série temporal da profundidade para o experimento 1

serie5 <- read.csv('dados1_prof.csv')
View(serie5)

plot.ts(serie5)
prof1 <- plot.ts(serie5$Profundidade)

prof1 <- plot(serie5, type = "l", 
             lwd = 2,
             col = "blue",
             main = "Série Temporal do Experimento 1 - Espessura da Neve", 
             xlab = "Unidade de Tempo",
             ylab = "Espessura da Neve")

#salvando a série temporal da prof1 por export

#série temporal da temp real para o experimento 2

serie6 <- read.csv('dados2_tempreal.csv')
View(serie6)

plot.ts(serie6)
tempreal2 <- plot.ts(serie6$Temperatura.Real)

tempreal2 <- plot(serie6, type = "l", 
              lwd = 2,
              col = "blue",
              main = "Série Temporal do Experimento 2 - Temperatura Real", 
              xlab = "Unidade de Tempo",
              ylab = "Temperatura Real")

#salvando a série temporal da tempreal2 por export

#série temporal da temp mod para o experimento 2

serie7 <- read.csv('dados2_tempmod.csv')
View(serie7)

plot.ts(serie7)
tempmod2 <- plot.ts(serie7$Temp.Mod.)

tempmod2 <- plot(serie7, type = "l", 
                  lwd = 2,
                  col = "blue",
                  main = "Série Temporal do Experimento 2 - Temperatura Modificada", 
                  xlab = "Unidade de Tempo",
                  ylab = "Temperatura Modificada")

#salvando a série temporal da tempmod2 por export

#série temporal da pressao para o experimento 2

serie8 <- read.csv('dados2_pres.csv')
View(serie8)

plot.ts(serie8)
pres2 <- plot.ts(serie8$Pressão)

pres2 <- plot(serie8, type = "l", 
                  lwd = 2,
                  col = "blue",
                  main = "Série Temporal do Experimento 2 - Pressão", 
                  xlab = "Unidade de Tempo",
                  ylab = "Pressão")

#salvando a série temporal da pres2 por export

#série temporal da alt2 para o experimento 2

serie9 <- read.csv('dados2_alt.csv')
View(serie9)

plot.ts(serie9)
alt2 <- plot.ts(serie9$Altitude)

alt2 <- plot(serie9, type = "l", 
                  lwd = 2,
                  col = "blue",
                  main = "Série Temporal do Experimento 2 - Altitude", 
                  xlab = "Unidade de Tempo",
                  ylab = "Altitude")

#salvando a série temporal da alt2 por export

#série temporal da prof2 para o experimento 2

serie10 <- read.csv('dados2_prof.csv')
View(serie10)

plot.ts(serie10)
prof2 <- plot.ts(serie10$Profundidade)

prof2 <- plot(serie10, type = "l", 
                  lwd = 2,
                  col = "blue",
                  main = "Série Temporal do Experimento 3 - Espessura da Neve", 
                  xlab = "Unidade de Tempo",
                  ylab = "Espessura da Neve")

#salvando a série temporal da prof2 por export

#série temporal da tempreal2 para o experimento 3

serie11 <- read.csv('dados3_tempreal.csv')
View(serie11)

plot.ts(serie11)
tempreal3 <- plot.ts(serie11$Temperatura.Real)

tempreal3 <- plot(serie11, type = "l", 
              lwd = 2,
              col = "blue",
              main = "Série Temporal do Experimento 3 - Temperatura Real", 
              xlab = "Unidade de Tempo",
              ylab = "Temperatura Real")

#salvando a série temporal da tempreal3 por export

#série temporal da tempmod3 para o experimento 3

serie12 <- read.csv('dados3_tempmod.csv')
View(serie12)

plot.ts(serie12)
tempmod3 <- plot.ts(serie12$Temp.Mod.)

tempmod3 <- plot(serie12, type = "l", 
              lwd = 2,
              col = "blue",
              main = "Série Temporal do Experimento 3 - Temperatura Modificada", 
              xlab = "Unidade de Tempo",
              ylab = "Temperatura Modificada")

#salvando a série temporal da pres3 por export

serie13 <- read.csv('dados3_pres.csv')
View(serie13)

plot.ts(serie13)
pres3 <- plot.ts(serie13$Pressão)

pres3 <- plot(serie13, type = "l", 
                 lwd = 2,
                 col = "blue",
                 main = "Série Temporal do Experimento 3 - Pressão", 
                 xlab = "Unidade de Tempo",
                 ylab = "Pressão")

#salvando a série temporal da alt3 por export

serie14 <- read.csv('dados3_alt.csv')
View(serie14)

plot.ts(serie14)
alt3 <- plot.ts(serie14$Altitude)

alt3 <- plot(serie14, type = "l", 
                 lwd = 2,
                 col = "blue",
                 main = "Série Temporal do Experimento 3 - Altitude", 
                 xlab = "Unidade de Tempo",
                 ylab = "Altitude")

#salvando a série temporal da prof3 por export

serie15 <- read.csv('dados3_prof.csv')
View(serie15)

plot.ts(serie15)
prof3 <- plot.ts(serie15$Profundidade)

prof3 <- plot(serie15, type = "l", 
                 lwd = 2,
                 col = "blue",
                 main = "Série Temporal do Experimento 3 - Espessura da Neve", 
                 xlab = "Unidade de Tempo",
                 ylab = "Espessura da Neve")

#salvando a série temporal da tempmod3 por export

#Correlação de Spearman
#Prof x Temp. Mod.

dados1 <- read.csv("dados1.csv") #experimento 1

View(dados1)

plot(dados1$Profundidade,dados1$Temp.Mod.)
cor.test(dados1$Profundidade,dados1$Temp.Mod., method = "spearman") #correlação de spearman

dados2 <- read.csv("dados2.csv") #experimento 2
View(dados2)

plot(dados2$Profundidade,dados2$Temp.Mod.)
cor.test(dados2$Profundidade,dados2$Temp.Mod., method = "spearman") #correlação de spearman

dados3 <- read.csv("dados3.csv") #experimento 3

View(dados3)

plot(dados3$Profundidade,dados3$Temp.Mod.)
cor.test(dados3$Profundidade,dados3$Temp.Mod., method = "spearman") #correlação de spearman

#Pres x Alt

#experimento 1

plot(dados1$Pressão,dados1$Altitude)
cor.test(dados1$Pressão,dados1$Altitude, method = "spearman") #correlação de spearman

#experimento 2

plot(dados2$Pressão,dados2$Altitude)
cor.test(dados2$Pressão,dados2$Altitude, method = "spearman") #correlação de spearman

#experimento 3

plot(dados3$Pressão,dados3$Altitude)
cor.test(dados3$Pressão,dados3$Altitude, method = "spearman") #correlação de spearman
