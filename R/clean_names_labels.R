#' @title Clean names and store labels
#' @description
#' Use janitor::clean_names to clean names but storing old names as labels in columns
#' @param dat The dataframe
#' @param ... Arguments passed to janitor::clean_names
#' @export

clean_names_labels <- function(dat, ...){

  if (!requireNamespace("janitor", quietly = TRUE)) {
    stop(
      "Package 'janitor' needed for this function to work. Please install it.",
      call. = FALSE
    )
  }

  old_names <- names(dat)
  dat <- janitor::clean_names(dat, ...)
  purrr::walk(1:ncol(dat), \(i) attr(dat[[i]], "label") <<- old_names[[i]])
  dat
}

