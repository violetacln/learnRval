

### ex.1.3. Forbidden patterns

# rule_ex3 <- validator( does_not_contain(glob(forbidden_keys))) )
library(tidyverse)
data(diamonds)

# possible combinations can be checked
# dplyr::distinct(tibble(diamonds$cut, diamonds$clarity))

df <- diamonds

# we can invent a forbidden pattern like:
our_forbidden <- data.frame(cut="G*", clarity="VVS*")

rules3 <- validator(does_not_contain(glob(forbidden_keys)))

out3 <- validate::confront(df
                           , rules3
                           , ref=list(forbidden_keys = our_forbidden ))

# first version of this code had an error when defining out3, please compare!

summary(out3)  

# check if and why the rules are wrong, if they are
errors(out3)
warnings(out3)

# violating(diamonds, out3)

