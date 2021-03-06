% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wb_color_palette_functions.R
\name{scale_color_wb}
\alias{scale_color_wb}
\title{Color scale constructor for wb colors}
\usage{
scale_color_wb(palette = "main", discrete = TRUE, reverse = FALSE, ...)
}
\arguments{
\item{palette}{Character name of palette in wb_palettes}

\item{discrete}{Boolean indicating whether color aesthetic is discrete or not}

\item{reverse}{Boolean indicating whether the palette should be reversed}

\item{...}{Additional arguments passed to discrete_scale() or
scale_color_gradientn(), used respectively when discrete is TRUE or FALSE}
}
\description{
Color scale constructor for wb colors
}
