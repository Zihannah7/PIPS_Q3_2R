## PIPS_Q3_2R
this is a readme file for PIPS-2024 assignment 3.2R at UvA.

# remind_me()
this is a function that takes no input and only prints a shopping list.

use it as:

remind_me()

# cheat()
this function accepts a numeric input (an inc <= 3) and returns the corresponding code (solution) and output of the code (e.g., plot).

this function needs "titanic" and "tidyverse" packages. please make sure they are installed before running the code.

use it as:

cheat()  # By default, it returns the Q3.1.1.

cheat(3)

# make_art()
this function makes (ugly) pictures of two kinds: stripes and squares. you can indicate by add an argument: type = "stripe" OR type = "square"

this function needs "rwantshue" and "tidyverse" packages. please make sure they are installed before running the code.

this function also accepts an argument of random seed to make reproducible artworks.

use it as:

make_art()  # By default, it sets seed as 1234, and the type is "stripe".

make_art(478612, "square")
