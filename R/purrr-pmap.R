# Implementation from: https://github.com/r-lib/rlang/blob/master/R/compat-purrr.R

#' @export
#' @rdname map
pmap <- function(.l, .f, ...) {
  .f <- as_function(.f)
  args <- .args_recycle(.l)
  do.call("mapply", c(
    FUN = list(quote(.f)),
    args, MoreArgs = quote(list(...)),
    SIMPLIFY = FALSE, USE.NAMES = FALSE
  ))
}

#' @export
#' @rdname map
pmap_lgl <- function(.l, .f, ...) {
  as.logical(pmap(.l, .f, ...))
}

#' @export
#' @rdname map
pmap_int <- function(.l, .f, ...) {
  as.integer(pmap(.l, .f, ...))
}

#' @export
#' @rdname map
pmap_dbl <- function(.l, .f, ...) {
  as.double(pmap(.l, .f, ...))
}

#' @export
#' @rdname map
pmap_chr <- function(.l, .f, ...) {
  as.character(pmap(.l, .f, ...))
}

#' @export
#' @rdname map
pmap_dfc <- function(.l, .f, ...) {
  result_list <- pmap(.l, .f, ...)
  bind_cols(result_list)
}

#' @export
#' @rdname map
pmap_dfr <- function(.l, .f, ..., .id = NULL) {
  result_list <- pmap(.l, .f, ...)
  bind_rows(result_list, .id = .id)
}

#' @export
#' @rdname map
pmap_df <- pmap_dfr

#' @export
#' @rdname map
pmap_vec <- function(.l, .f, ..., .ptype = NULL) {
  out <- pmap(.l, .f, ...)
  list_simplify(out, .ptype)
}

.args_recycle <- function(args) {
  lengths <- map_int(args, length)
  n <- max(lengths)

  stopifnot(all(lengths == 1L | lengths == n))
  to_recycle <- lengths == 1L
  args[to_recycle] <- map(args[to_recycle], function(x) rep.int(x, n))

  args
}
