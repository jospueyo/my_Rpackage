#' function to sound a beep

beep <- function(n = 3){
  for(i in seq(n)){
    system("rundll32 user32.dll,MessageBeep")
    Sys.sleep(1)
  }
}
