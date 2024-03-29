% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/join.R
\name{cross_join}
\alias{cross_join}
\title{Cross join}
\usage{
cross_join(x, y, ..., suffix = c(".x", ".y"))
}
\arguments{
\item{x}{A data.frame or data.table}

\item{y}{A data.frame or data.table}

\item{...}{Other parameters passed on to methods}

\item{suffix}{Append created for duplicated column names when using \code{full_join()}}
}
\description{
Cross join each row of \code{x} to every row in \code{y}.
}
\examples{
df1 <- tidytable(x = 1:3)
df2 <- tidytable(y = 4:6)

cross_join(df1, df2)
}
