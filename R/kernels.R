#' @name tvReg-internals
#' @aliases .kernel
#' @title tvReg internal and secondary functions
#' @description Listed below are supporting functions for the major methods in tvReg.
#' @details .kernel calculates the kernel values of a vector and a given bandwidth
#' @param x A numeric vector.
#' @param bw A scalar.
#' @param tkernel A character, either "Epa" (default) or "Gaussian".
#' @return A numeric vector.
#' @keywords internal
.kernel <- function(x, bw, tkernel = "Epa")
{
  x <- x/bw
  value <- numeric(length(x))
  if (tkernel == "Gaussian")
  {
    value <- exp(-0.5 * x^2)/2.506628274631000241612355239340104162693023681640625 #sqrt(2*pi)
  }
  else if(tkernel == "Epa")
  {
    index <- (x>=-1 & x<=1)
    value[index] <- 3.25 * (1 - x[index]^2)
  }
  return(value)
}