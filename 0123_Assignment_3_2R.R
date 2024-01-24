# Assignment 3.2R Solutions - 2024 Programming in Psychological Science (PIPS)
#
# Record of Revisions
#
# Date        Programmer          Descriptions of Change
# ====       ================    ======================
# 26-Jan-24  Zihan Xiao 14944731  start in 0123

# Q3.2.1 -----------------------------------------------------------------------
remind_me = function() {
  cat("Shopping list for next week:", "\n",
    "1. Spitsool, tomato", "\n",
    "2. Rookworst, egg, milk", "\n",
    "3. Bread, muffin, chips", "\n")
}
remind_me()

cheat = function(num = 1) {
  # this function print solutions & plots for the first three questions.
  # this function needs "titanic" and "tidyverse" packages.
  if (! is.numeric(num)){
    stop('only numeric values allowed')
  }
  if (round(num) != num){
    stop('only int allowed')
  }
  if (num > 3) {
    stop('currently we only offer the solutions for the first three questions')
  }
  if (num == 1) {
    simulated_grades <- c()
    for (i in 1:70) {
      simulated_grade <- round(rnorm(1, mean = 7.5, sd = 1), 2)
      while (simulated_grade > 10) {
        simulated_grade <- rnorm(1, mean = 7.5, sd = 1)
      }
      simulated_grades <- append(simulated_grades, simulated_grade)
    }
    hist(simulated_grades)
    cat("#Solution for Q3.1.1
    simulated_grades <- c()
    for (i in 1:70) {
      simulated_grade <- round(rnorm(1, mean = 7.5, sd = 1), 2)
      while (simulated_grade > 10) {
        simulated_grade <- rnorm(1, mean = 7.5, sd = 1)
      }
      simulated_grades <- append(simulated_grades, simulated_grade)
    }
    hist(simulated_grades)")
  } else if (num == 2) {
    data2 <- read.csv("https://bit.ly/3GLVQ86")
    colnames(data2)
    plot(data2$DATE, data2$TMIN,
         type = "p", col = "darkblue",
         xlab = "time", ylab = "minimum temperature")
    cat("#Solution for Q3.1.2
    data2 <- read.csv('https://bit.ly/3GLVQ86')
    colnames(data2)
    plot(data2$DATE, data2$TMIN,
         type = 'p', col = 'darkblue',
         xlab = 'time', ylab = 'minimum temperature')")
  } else if (num == 3) {
    library(titanic)
    titanic_train$count <- rep(1, 891)
    titanic_train$dead_alive <- ifelse(titanic_train$Survived == 0, "dead", "alive")
    colnames(titanic_train)
    library(tidyverse)
    ggplot(data = titanic_train,
           aes(x = Sex, y = sum(count) / 1000,
               fill = factor(dead_alive, levels = c("dead", "alive")))) +
      geom_bar(stat = "identity") +
      labs(y = "count", fill = "How did it go?")
    cat("#Solution for Q3.1.3
    library(titanic)
    titanic_train$count <- rep(1, 891)
    titanic_train$dead_alive <- ifelse(titanic_train$Survived == 0, 'dead', 'alive')
    colnames(titanic_train)
    library(tidyverse)
    ggplot(data = titanic_train,
           aes(x = Sex, y = sum(count) / 1000,
               fill = factor(dead_alive, levels = c('dead', 'alive')))) +
      geom_bar(stat = 'identity') +
      labs(y = 'count', fill = 'How did it go?')")
  }
}
cheat(1)

# Q3.2.2 -----------------------------------------------------------------------
make_art = function(r_seed = 1234, type = "stripe") {
  # get inspired by stripes & squares in artsy package.
  # this function make random "art" (maybe?)
  set.seed(r_seed)
  library(tidyverse)
  # devtools::install_github("hoesler/rwantshue")
  library(rwantshue)
  # first type: stripe
  if (type == "stripe") {
    total_stripe = sample(20:200, 1)
    x_value = runif(n = total_stripe, min = 0, max = 100)
    y_value = runif(n = total_stripe, min = 0, max = 100)
    l_width = runif(n = total_stripe*2, min = 0, max = 5)
    dt = as.data.frame(x_value)
    dt$y_value = y_value
    scheme <- iwanthue(seed = r_seed, force_init = TRUE)  # create a color scheme
    ggplot(dt) + 
      geom_vline(aes(xintercept = x_value, color = factor(x_value), 
                     linewidth = factor(x_value)), alpha = 0.5) + 
      geom_hline(aes(yintercept = y_value, color = factor(y_value), 
                     linewidth = factor(x_value)), alpha = 0.5) + 
      scale_color_manual(values = scheme$hex(total_stripe*2)) +
      scale_linewidth_manual(values = l_width) +
      theme(axis.line = element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks = element_blank(),
            axis.title.x = element_blank(),
            axis.title.y = element_blank(),
            legend.position = "none",
            panel.background = element_rect(fill = scheme$hex(total_stripe*2+1),
                                          colour = scheme$hex(total_stripe*2+1)),
            panel.border = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.background = element_blank())
  } else if (type == "square") {  # second type: square
    total_square = sample(1:8, 1)
    scheme <- iwanthue(seed = r_seed, force_init = TRUE)
    x_min = c()
    x_max = c()
    y_min = c()
    y_max = c()
    for (i in 1:total_square) {
      x_value = runif(n = 2, min = 0, max = 100)
      y_value = runif(n = 2, min = 0, max = 100)
      x_min = append(x_min, min(x_value))
      x_max = append(x_max, max(x_value))
      y_min = append(y_min, min(y_value))
      y_max = append(y_max, max(y_value))
    }
    dt = data.frame(x_min = x_min, x_max = x_max, y_min = y_min, y_max = y_max)
    ggplot() +
      geom_rect(data = dt, aes(xmin = x_min, xmax = x_max, ymin = y_min, 
                               ymax = y_max),
                fill = scheme$hex(total_square), alpha = 0.5,
                color = "black", linewidth = 1) +
      xlim(0,100) + 
      ylim(0,100) +
      theme(axis.line = element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks = element_blank(),
            axis.title.x = element_blank(),
            axis.title.y = element_blank(),
            legend.position = "none",
            panel.background = element_rect(fill = scheme$hex(total_square+1)[total_square+1],
                                            colour = scheme$hex(total_square+1)[total_square+1]),
            panel.border = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.background = element_blank())
  }
}
make_art()
make_art(1234, "square")

