% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tt_pos_and_access.R
\name{insert_row_at_path}
\alias{insert_row_at_path}
\alias{insert_row_at_path,VTableTree,DataRow-method}
\alias{insert_row_at_path,VTableTree,ANY-method}
\title{Insert Row at Path}
\usage{
insert_row_at_path(tt, path, value, after = FALSE)

\S4method{insert_row_at_path}{VTableTree,DataRow}(tt, path, value, after = FALSE)

\S4method{insert_row_at_path}{VTableTree,ANY}(tt, path, value)
}
\arguments{
\item{tt}{TableTree (or related class). A TableTree object representing a
populated table.}

\item{path}{character. A vector path for a position within the structure of a
tabletree. Each element represents a subsequent choice amongst the children
of the previous choice.}

\item{value}{The new value}

\item{after}{logical(1). Should \code{value} be added as a row directly before (\code{FALSE},
the default) or after (\code{TRUE}) the row specified by \code{path}.}
}
\description{
Insert a row into an existing table directly before or directly after an existing
data (i.e., non-content and non-label) row, specified by its path.
}
\examples{

lyt <- basic_table() \%>\%
  split_rows_by("COUNTRY", split_fun = keep_split_levels(c("CHN", "USA"))) \%>\%
  analyze("AGE")

tbl <- build_table(lyt, DM)

tbl2 <- insert_row_at_path(tbl, c("COUNTRY", "CHN", "AGE", "Mean"),
                          rrow("new row", 555))
tbl2

tbl3 <- insert_row_at_path(tbl2, c("COUNTRY", "CHN", "AGE", "Mean"),
                          rrow("new row redux", 888),
                          after = TRUE)
tbl3
}
\seealso{
\code{\link[=DataRow]{DataRow()}} \code{\link[=rrow]{rrow()}}
}
