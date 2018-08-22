
library(tidytext)
library(tidyverse)
library(xkcd)

# Load abstract text
abstracts <- as.tibble(read_file("https://raw.githubusercontent.com/jduckles/spnhc-tdwg-abstracts-2018/master/abstracts.txt"))

# add custom stop words
other_stops = c("al") # removing al from et al.

# merge my stops with tidytext `stop_words`
stops <- rbind(stop_words,data.frame(word=other_stops,lexicon="custom"))

# Tokenize and remove stop words
abstract_words <- abstracts %>% unnest_tokens(word, value) %>% anti_join(stops)

frequent_words <- abstract_words %>%
  count(word, sort = TRUE) %>%         
  filter(n > 80) %>%                    
  mutate(word = reorder(word, n)) 

svg('frequent_words.svg')
frequent_words %>%  ggplot(aes(word, n)) +                
  geom_col(fill = "darkblue") +  
  xlab("Word") +                       
  ylab("Number of Occurances") + 
  labs(title = "Most Common words in 'SPNHC-TDWG Abstracts'") +
  coord_flip() +                      
  theme_xkcd()                     
dev.off()

