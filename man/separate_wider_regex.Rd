% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/separate_wider_regex.R
\name{separate_wider_regex}
\alias{separate_wider_regex}
\title{Separate a character column into multiple columns using regex patterns}
\usage{
separate_wider_regex(
  .df,
  cols,
  patterns,
  ...,
  names_sep = NULL,
  names_repair = "check_unique",
  too_few = "error",
  cols_remove = TRUE
)
}
\arguments{
\item{.df}{A data frame}

\item{cols}{Columns to separate}

\item{patterns}{patterns}

\item{...}{These dots are for future extensions and must be empty.}

\item{names_sep}{Names separator}

\item{names_repair}{Treatment of duplicate names. See \code{?vctrs::vec_as_names} for options/details.}

\item{too_few}{What to do when too few column names are supplied}

\item{cols_remove}{Should old columns be removed}
}
\description{
Separate a character column into multiple columns using regex patterns
}
\examples{
df <- tidytable(id = 1:3, x = c("m-123", "f-455", "f-123"))

df \%>\%
  separate_wider_regex(x, c(gender = ".", ".", unit = "\\\\d+"))
}
