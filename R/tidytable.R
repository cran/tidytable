#' Build a data.table/tidytable
#'
#' @description
#' Constructs a data.table, but one with nice printing features.
#'
#' @param ... A set of name-value pairs
#' @param .name_repair Treatment of duplicate names. See `?vctrs::vec_as_names` for options/details.
#'
#' @export
#'
#' @examples
#' tidytable(x = 1:3, y = c("a", "a", "b"))
tidytable <- function(..., .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  dots <- dots_list(..., .named = TRUE)

  df <- data_frame(!!!dots, .name_repair = .name_repair)

  setDT(df)

  setattr(df, "class", c("tidytable", "data.table", "data.frame"))

  df
}
