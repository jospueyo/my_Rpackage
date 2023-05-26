#' Join by partial string
#' @param x data.frame x
#' @param y data.frame y
#' @param by_x column in x to join by (string)
#' @param pattern_y column in y to look for patterns (string)

partial_join <- function(x, y, by_x, pattern_y) {
  idx_x <- sapply(y[[pattern_y]], grep, x[[by_x]])
  idx_y <- sapply(seq_along(idx_x), function(i) rep(i, length(idx_x[[i]])))
  
  df <- dplyr::bind_cols(x[unlist(idx_x), , drop = F],
                         y[unlist(idx_y), , drop = F])
  return(df)
}

