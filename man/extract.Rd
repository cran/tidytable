% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract.R
\name{extract}
\alias{extract}
\title{Extract a character column into multiple columns using regex}
\usage{
extract(
  .df,
  col,
  into,
  regex = "([[:alnum:]]+)",
  remove = TRUE,
  convert = FALSE,
  ...
)
}
\arguments{
\item{.df}{A data.table or data.frame}

\item{col}{Column to extract from}

\item{into}{New column names to split into. A character vector.}

\item{regex}{A regular expression to extract the desired values. There
should be one group (defined by \verb{()}) for each element of \code{into}}

\item{remove}{If TRUE, remove the input column from the output data.table}

\item{convert}{If TRUE, runs \code{type.convert()} on the resulting column.
Useful if the resulting column should be type integer/double.}

\item{...}{Additional arguments passed on to methods.}
}
\description{
\emph{Superseded}

\code{extract()} has been superseded by \code{separate_wider_regex()}.

Given a regular expression with capturing groups, \code{extract()} turns each group
into a new column. If the groups don't match, or the input is \code{NA}, the output
will be \code{NA}. When you pass same name in the \code{into} argument it will merge
the groups together. Whilst passing \code{NA} in the \code{into} arg will drop the group
from the resulting \code{tidytable}
}
\examples{
df <- data.table(x = c(NA, "a-b-1", "a-d-3", "b-c-2", "d-e-7"))
df \%>\% extract(x, "A")
df \%>\% extract(x, c("A", "B"), "([[:alnum:]]+)-([[:alnum:]]+)")

# If no match, NA:
df \%>\% extract(x, c("A", "B"), "([a-d]+)-([a-d]+)")
# drop columns by passing NA
df \%>\% extract(x, c("A", NA, "B"), "([a-d]+)-([a-d]+)-(\\\\d+)")
# merge groups by passing same name
df \%>\% extract(x, c("A", "B", "A"), "([a-d]+)-([a-d]+)-(\\\\d+)")
}
