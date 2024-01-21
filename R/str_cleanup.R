#' @title Cleanup names
#' @description
#' Function to move from janitor::clean_names to names nice to plot.

str_cleanup <- function (string)
{
  string <- stringr::str_replace_all("_", " ", string)
  stringr::str_to_sentence(string)
}
