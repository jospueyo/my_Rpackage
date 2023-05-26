library(tidyverse)

create_char <- function(x){
  paste(sample(letters, 3, replace = T), collapse = "")
}

df <- tibble(
  text =  c(
    "ffadgafñlk Josepfgfs sdvkñ dsñvnsfñ fsdñvsnfv Bru",
    "fdfdg judit dsvsdnv mont dsñgkdsgñj cvfsñkv",
    "mont dfajsdn ds´vksdj Judit dslkvds",
    "bru dsvks´m mont sdvf josep dsvksfkl Josep",
    "fdbdfk bru fdbdfkm"
  )
) |> 
  mutate(id = row_number(), .before = 1)


pattern <- tibble(
  names1 = c("josep", "judit", "mont", "bru"),
  names2 = c("Josep", "Judit", "Mont", "Bru")
)

pattern_long <- pattern |> 
  pivot_longer(everything()) |> 
  mutate(value_boundary = paste0("\\b", value, "\\b"))
  

# partial join ----------------------------------------------------------------------------------------------------

partial_join <- function(x, y, by_x, pattern_y) {
  idx_x <- sapply(y[[pattern_y]], grep, x[[by_x]])
  idx_y <- sapply(seq_along(idx_x), function(i) rep(i, length(idx_x[[i]])))
  
  df <- dplyr::bind_cols(x[unlist(idx_x), , drop = F],
                         y[unlist(idx_y), , drop = F])
  return(df)
}


df |> 
  partial_join(y = pattern_long, by_x = "text", pattern_y = "value_boundary")

