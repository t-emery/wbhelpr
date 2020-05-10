# World Bank ggplot2 colors
#
# Purpose:  this script provides the data for the ggplot colors that are in line with the
# World Bank's branding and visual identity guidelines, available on their website.
# I made up some of the palettes
#
# Output:
# wb_colors:  this has the colors and the hex codes from the visual
#
# wb_palettes:  this has color palettes.  some of them are from the sheet and some of them I
# made up. Definitely can be improved
#
# wb_country_groups_list:  this tibble has all 46 unique groupings in the wb_country_groups tibble.

library(devtools)

wb_colors <- c(
  `solid blue` = "#002244",
  `bright blue` = "#009FDA",
  `black` = "#000000",
  `white` = "#FFFFFF",
  `light grey` = "#CCCCCC",
  `dark grey` = "#9B9B9B",
  `flamingo` = "#F05023",
  `sun` = "#FDB714",
  `wb red` = "#eb1c2d",
  `sea buckthorn` = "#F78D28",
  `bondi blue` = "#009CA7",
  `green haze` = "#00AB51",
  `vivid violet` = "#872B90",
  `persian green` = "#00A996",
  `mexican red` = "#98252B",
  `clementine` = "#E16A2D",
  `nugget` = "#B88C1D",
  `mulled wine` = "#614776",
  `blue stone` = "#006068",
  `green stone` = "#006450"
)

####
# the function itself gets defined elsewhere in the package.  whilte this should be stable, make sure it is the same.
# This is defined here just to make the next section work.
wb_cols <- function(...) {

  cols <- c(...)

  if (is.null(cols)) {
    return(wb_colors)
  }

  wb_colors[cols]
}


####

wb_palettes <- list(
  `main` = wb_cols("solid blue", "bright blue", "black", "light grey"), # official is white

  `blue green` = wb_cols("solid blue", "bright blue", "light grey", "bondi blue", "blue stone"),

  `qualitative 1` = wb_cols("solid blue", "bright blue", "black",
                            "light grey", "bondi blue", "dark grey", "blue stone"),

  `sequential 1` = wb_cols("black", "solid blue", "bright blue",  "blue stone",
                           "bondi blue", "dark grey", "light grey"),

  `bright warm` = wb_cols("flamingo", "sun", "wb red", "sea buckthorn"),

  `bright cool` = wb_cols("bondi blue", "green haze", "vivid violet", "persian green"),

  `bright` = wb_cols("flamingo", "sun", "wb red", "sea buckthorn", "bondi blue",
                     "green haze", "vivid violet", "persian green"),

  `neutral warm` = wb_cols("mexican red", "clementine", "nugget"),

  `neutral cool` = wb_cols("mulled wine", "blue stone", "green stone"),

  `neutral` = wb_cols("mexican red", "clementine", "nugget",
                      "mulled wine", "blue stone", "green stone"),

  `warm` = wb_cols("flamingo", "sun", "wb red", "sea buckthorn",
                   "mexican red", "clementine", "nugget"),

  `cool` = wb_cols("bondi blue", "green haze", "vivid violet", "persian green",
                   "mulled wine", "blue stone", "green stone")


)

use_data(wb_colors, overwrite = TRUE)

use_data(wb_palettes, overwrite = TRUE)
