#' Return function to interpolate a drsimonj color palette
#'
#' @param ... Optional character color names
#'
wb_cols <- function(...) {

  cols <- c(...)

  if (is.null(cols)) {
    return(wb_colors)
  }

  wb_colors[cols]
}


#' Return function to interpolate a wb color palette
#'
#' @param palette Character name of palette wb_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
wb_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- wb_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}



#' Color scale constructor for wb colors
#'
#' @param palette Character name of palette in wb_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_wb <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- wb_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("wb_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for wb colors
#'
#' @param palette Character name of palette in wb_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_wb <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- wb_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("wb_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
