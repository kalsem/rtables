% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tt_export.R
\name{export_as_txt}
\alias{export_as_txt}
\title{Export as plain text with page break symbol}
\usage{
export_as_txt(
  tt,
  file = NULL,
  page_type = NULL,
  landscape = FALSE,
  pg_width = page_dim(page_type)[if (landscape) 2 else 1],
  pg_height = page_dim(page_type)[if (landscape) 1 else 2],
  font_family = "Courier",
  font_size = 8,
  paginate = .need_pag(page_type, pg_width, pg_height, lpp, cpp),
  cpp = NULL,
  lpp = NULL,
  ...,
  page_break = "\\\\s\\\\n",
  hsep = default_hsep(),
  indent_size = 2,
  tf_wrap = paginate,
  max_width = cpp,
  colwidths = propose_column_widths(matrix_form(tt, TRUE))
)
}
\arguments{
\item{tt}{TableTree (or related class). A TableTree object representing a
populated table.}

\item{file}{character(1). File to write.}

\item{page_type}{character(1).   Name   of  a  page  type.   See
\code{page_types}.   Ignored when  \code{pg_width} and  \code{pg_height}
are set directly.}

\item{landscape}{logical(1). Should the  dimensions of \code{page_type}
be inverted  for landscape?  Defaults to  \code{FALSE}, ignored when
\code{pg_width} and \code{pg_height} are set directly.}

\item{pg_width}{numeric(1). Page width in inches.}

\item{pg_height}{numeric(1). Page height in inches.}

\item{font_family}{character(1). Name of a font family. An error
will be thrown if the family named is not monospaced. Defaults
to Courier.}

\item{font_size}{numeric(1). Font size, defaults to 12.}

\item{paginate}{logical(1). Should \code{tt} be paginated before writing the file. Defaults to \code{TRUE} if any sort of page dimension is specified.}

\item{cpp}{numeric(1) or NULL. Width (in characters) of the pages for
horizontal pagination. \code{NULL} (the default) indicates no horizontal
pagination should be done.}

\item{lpp}{numeric. Maximum lines per page including (re)printed header and context rows}

\item{\dots}{Passed directly to \code{\link{paginate_table}}}

\item{page_break}{character(1). Page break symbol (defaults to outputting \code{"\\s"}).}

\item{hsep}{character(1). Set of character(s) to be repeated as the separator
between the header and body of the table when rendered as text. Defaults to
a connected horizontal line (unicode 2014) in locals that use a UTF
charset, and to \code{-} elsewhere (with a once per session warning).}

\item{indent_size}{numeric(1). Number of spaces to use per indent level.
Defaults to 2}

\item{tf_wrap}{logical(1). Should  the texts for  title, subtitle,
and footnotes be wrapped?}

\item{max_width}{integer(1), character(1) or NULL. Width that title
and   footer   (including   footnotes)  materials   should   be
word-wrapped to. If NULL, it is  set to the current print width
of the  session (\code{getOption("width")}). If set to \code{"auto"},
the width of the table (plus any table inset) is used. Ignored
completely if \code{tf_wrap} is \code{FALSE}.}

\item{colwidths}{numeric vector. Column widths for use with vertical pagination.}
}
\value{
\code{file} (this function is called for the side effect of writing the file.
}
\description{
Export as plain text with page break symbol
}
\note{
When specified, \code{font_size} is used \emph{only} to determine pagination based
on page dimensions. The written file is populated in raw ASCII text, which
does not have the concept of font size.
}
\examples{

lyt <- basic_table() \%>\%
  split_cols_by("ARM") \%>\%
  analyze(c("AGE", "BMRKR2", "COUNTRY"))

tbl <- build_table(lyt, ex_adsl)

cat(export_as_txt(tbl, file = NULL, paginate = TRUE, lpp = 8))

\dontrun{
tf <- tempfile(fileext = ".txt")
export_as_txt(tbl, file = tf)
system2("cat", tf)
}
}
\seealso{
\code{\link[=export_as_pdf]{export_as_pdf()}}
}
