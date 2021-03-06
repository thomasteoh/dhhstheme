devtools::load_all()

library(tidyverse)
library(patchwork)

dhhs_teal
dhhs_purple4
dhhs_purple6
dhhs_navy1


# Slide 1 ----------------------------------------------------------------------
mtcars %>%
  ggplot(aes(hp, wt)) +
  geom_point(size = 6, alpha = .9) +
  theme_dhhs() +
  labs(title = "This an informative title",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label",
       caption = "Sources and notes for the chart.")

dhhs_save("data-raw/output/base.png", type = "half")
dhhs_save("data-raw/output/base.png", type = "half", ppt_size = "normal169")


# Slide 2 ----------------------------------------------------------------------
mtcars %>%
  ggplot(aes(hp, wt)) +
  geom_point(size = 6, alpha = .9) +
  theme_dhhs() +
  labs(title = "First chart title",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/consistent1.png", type = "third")

mtcars %>%
  ggplot(aes(factor(cyl), hp)) +
  geom_point(size = 6, alpha = .9) +
  geom_boxplot() +
  theme_dhhs() +
  labs(title = "Another title",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/consistent2.png", type = "third")

p2 <- mtcars %>%
  ggplot(aes(factor(cyl), hp)) +
  geom_col() +
  theme_dhhs() +
  labs(title = "Yay another one",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")
p2
dhhs_save("data-raw/output/consistent3.png", type = "third")


# Slide 3 ----------------------------------------------------------------------
mtcars %>%
  ggplot(aes(hp, wt)) +
  geom_point(size = 6, alpha = .9) +
  theme_dhhs(base_colour = dhhs_pink,
             panel_borders = "none",
             include_minor_gridlines = "both") +
  labs(title = "Pink chart title",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/flexible1.png", type = "third")

mtcars %>%
  ggplot(aes(factor(cyl), hp)) +
  geom_point(size = 6, alpha = .9) +
  geom_boxplot() +
  theme_dhhs(base_colour = dhhs_teal) +
  labs(title = "Teal chart title",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/flexible2.png", type = "third")

mtcars %>%
  ggplot(aes(factor(cyl), hp)) +
  geom_col() +
  theme_dhhs(base_colour = dhhs_purple,
             panel_borders = "border") +
  labs(title = "Purple chart title",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/flexible3.png", type = "third")



# Slide 8: colours -------------------------------------------------------------
mtcars %>%
  ggplot(aes(hp, wt,
             colour = factor(cyl))) +
  geom_point(size = 6, alpha = .8) +
  theme_dhhs() +
  dhhs_colour_manual(3) +
  labs(title = "A plot with DHHS colours",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label",
       colour = "Legend title",
       caption = "Sources and notes.")

dhhs_save("data-raw/output/colours.png", type = "half")


mtcars %>%
  ggplot(aes(hp, wt,
             colour = factor(cyl))) +
  geom_point(size = 6, alpha = .8) +
  theme_dhhs() +
  dhhs_colour_manual(values = c(dhhs_teal, dhhs_pink, dhhs_blue)) +
  labs(title = "A plot with DHHS colours",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label",
       colour = "Legend title",
       caption = "Sources and notes.")



# Slide 8: colours -------------------------------------------------------------
mtcars %>%
  ggplot(aes(hp, wt,
             colour = factor(cyl))) +
  geom_point(size = 6, alpha = .8) +
  theme_dhhs() +
  dhhs_colour_manual(3, reverse = TRUE) +
  labs(title = "A plot with DHHS colours",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label",
       colour = "Legend title",
       caption = "Sources and notes.")

dhhs_save("data-raw/output/colours.png", type = "half")

# Slide 9: more colours demos --------------------------------------------------
p1 <- mtcars %>%
  ggplot(aes(factor(cyl), hp,
             colour = factor(cyl))) +
  geom_point(size = 6, alpha = .9) +
  geom_boxplot() +
  theme_dhhs() +
  dhhs_colour_manual(3) +
  labs(title = "Categorical colours",
       subtitle = "y-axis label",
       colour = "Legend\ntitle:",
       y = NULL,
       x = "x-axis label")

p1

dhhs_save("data-raw/output/colours1.png", type = "third")

# continous
p3 <- mtcars %>%
  ggplot(aes(hp, wt,
             colour = disp)) +
  geom_point(size = 6) +
  theme_dhhs(base_colour = dhhs_blue) +
  dhhs_colour_manual(discrete = FALSE,
                     palette = "diverging") +
  labs(title = "Continuous colour scale",
       subtitle = "y-axis label",
       colour = "Legend\ntitle:",
       y = NULL,
       x = "x-axis label")

p3

dhhs_save("data-raw/output/colours2.png", type = "third")

# fill
mtcars %>%
  ggplot(aes(factor(cyl), hp)) +
  geom_col(fill = dhhs_teal) +
  theme_dhhs(panel_borders = "border",
             legend = "off") +
  dhhs_fill_manual(2) +
  facet_wrap(~factor(am)) +
  labs(title = "Fill colour bar",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/colours3.png", type = "third")

# Facets
mtcars %>%
  ggplot(aes(factor(cyl), hp,
             fill = factor(am))) +
  geom_col() +
  theme_dhhs(base_colour = dhhs_purple,
             panel_borders = "border",
             legend = "off") +
  dhhs_fill_manual(2) +
  labs(title = "Fill colour bar",
       subtitle = "y-axis label",
       y = NULL,
       x = "x-axis label")

dhhs_save("data-raw/output/colours3.png", type = "third")


# Slide 10: exporting ----------------------------------------------------------

# Bad
ggsave("data-raw/output/bad1.png", plot = p1,
       height = 10, width = 10)

ggsave("data-raw/output/bad2.png", plot = p2,
       height = 3, width = 3)

# Good
dhhs_save("data-raw/output/good1.png", plot_object = p1,
          type = "short-third")

dhhs_save("data-raw/output/good2.png", plot_object = p2,
          type = "third")


# Slide 10: chart-data ---------------------------------------------------------

dhhs_save("data-raw/output/with-chartdata1.png", plot_object = p1,
          export_chartdata = TRUE)

dhhs_save("data-raw/output/with-chartdata3.png", plot_object = p3,
          export_chartdata = TRUE)

# Slide 11: export multiple charts
save_chartdata("data-raw/output/all-chartdata.xlsx",
               object = list(p1, p2, p3),
               cover_title = "This is the title!",
               cover_date = "1920-01-01")

