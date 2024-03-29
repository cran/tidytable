#' Run invisible garbage collection
#'
#' @description
#' Run garbage collection without the `gc()` output. Can also be run in the middle of a long pipe chain.
#' Useful for large datasets or when using parallel processing.
#'
#' @param x Optional. If missing runs `gc()` silently. Else returns the same object unaltered.
#' @export
#'
#' @examples
#' # Can be run with no input
#' inv_gc()
#'
#' df <- tidytable(col1 = 1, col2 = 2)
#'
#' # Or can be used in the middle of a pipe chain (object is unaltered)
#' df %>%
#'   filter(col1 < 2, col2 < 4) %>%
#'   inv_gc() %>%
#'   select(col1)
#' @export
inv_gc <- function(x) {
  if(missing(x)) {
    invisible(gc())
  } else {
    invisible(gc())
    return(x)
  }
}
