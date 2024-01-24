## PIPS_Q3_2R
# remind_me()
this is a function that takes no input and only prints a shopping list.
use it as:
remind_me()

# cheat()
this function accepts a numeric input (an inc <= 3) and returns the corresponding code (solution) and output of the code (e.g., plot).
this function needs "titanic" and "tidyverse" packages. make sure they are installed at first.
use it as:
cheat()  # By default, it returns the Q3.1.1.
cheat(3)

# make_art()
this function makes (ugly) pictures of two kinds: stripes and squares. you can indicate by add an argument: type = "stripe" OR type = "square"
this function needs "rwantshue" and "tidyverse" packages. make sure they are installed at first.
this function also accepts an argument of random seed to make reproducable artworks.
use it as:
make_art()  # By default, it set seed as 1234, and type is "stripe".
make_art(478612, "square")
