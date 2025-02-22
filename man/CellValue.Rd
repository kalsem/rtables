% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/00tabletrees.R
\name{CellValue}
\alias{CellValue}
\title{Cell Value constructor}
\usage{
CellValue(
  val,
  format = NULL,
  colspan = 1L,
  label = NULL,
  indent_mod = NULL,
  footnotes = NULL,
  align = NULL,
  format_na_str = NULL
)
}
\arguments{
\item{val}{ANY. value in the cell exactly as it should be passed to a
formatter or returned when extracted}

\item{format}{FormatSpec. Format associated with this split. Formats can be
declared via strings (\code{"xx.x"}) or function. In cases such as
\code{analyze} calls, they can character vectors or lists of functions.}

\item{colspan}{integer(1). Column span value.}

\item{label}{character(1). A label (not to be confused with the name) for the
object/structure.}

\item{indent_mod}{numeric. Modifier for the default indent position for the
structure created by this function(subtable, content table, or row)
\emph{and all of that structure's children}. Defaults to 0, which
corresponds to the unmodified default behavior.}

\item{footnotes}{list or \code{NULL}. Referential footnote messages for the cell.}

\item{align}{character(1) or \code{NULL}. Alignment the value should be rendered with.
It defaults to \code{"center"} if \code{NULL} is used. See \code{\link{rtables_aligns}}
for currently supported alignments.}

\item{format_na_str}{character(1). String which should be displayed when
formatted if this cell's value(s) are all NA.}
}
\value{
An object representing the value within a single cell within a
populated table. The underlying structure of this object is an
implementation detail and should not be relied upon beyond calling
accessors for the class.
}
\description{
Cell Value constructor
}
