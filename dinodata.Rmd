---
title: "Mindent a dínókról"
author: "Rainer Zita"
date: '2021.05.31.'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## A dinoszauruszok csodálatos világa

A dínók nagyon régen éltek. Olyan régen, hogy akkor emberek még nem is léteztek. Mégis tudunk róluk pár dolgot. 
A dínókról szóló adatokat a <https://www.kaggle.com/kjanjua/jurassic-park-the-exhaustive-dinosaur-dataset> oldalon találtam. Itt láthatsz egy rövid kivonatot arról, hogy milyen adatokat jegyeztek fel a dínókról:

```{r message = FALSE, warning = FALSE}
library(ggplot2)
url <- "https://github.com/rzita/dinodata/blob/main/dinosaur.csv"
dinodata <- read.csv(file = 'dinosaur.csv')
dinodata[1:1,]
```



Tudjuk a dínókról, hogy volt köztük **növényevő** és **húsevő** fajta, sőt ezek kombinációja (mindenevő) is. 

```{r message = FALSE, warning = FALSE}
library(tidyverse)
url <- "https://github.com/rzita/dinodata/blob/main/dinosaur.csv"
dinodata <- read.csv(file = 'dinosaur.csv')
dinodata %>%
    count(diet) %>% 
    mutate(diet = factor(diet), percentage = n / sum(n)) %>% 
    ggplot(aes(x = "", percentage, fill = diet)) +
    geom_col(color="white") +
    coord_polar(theta = "y", start=0) +
    theme_void()
```



A maradványaik pedig megmutatják, hogy nagyjából **mekkorák** voltak. 


```{r message = FALSE, warning = FALSE}
library(tidyverse)
url <- "https://github.com/rzita/dinodata/blob/main/dinosaur.csv"
dinodata <- read.csv(file = 'dinosaur.csv')
dinodata$length = as.factor(dinodata$length)
freq<-table(dinodata$length)
barplot(freq, main="Dinók nagyság szerinti megoszlása", ylab = "gyakoriság", xlab = "magasság")
```

**Ne érd be ennyivel! Sokféle adatot talász még a dínókról, amit te is szabadon elemezhetsz.**




--- VÉGE ---

