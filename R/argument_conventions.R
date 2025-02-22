# nocov start
## package imports
#' @importFrom utils head head.matrix tail tail.matrix
#' @importFrom stats setNames na.omit prop.test binom.test relevel quantile
#' @importFrom htmltools tags tagList
#' @importFrom magrittr %>%
#' @import methods
NULL


#' General Argument Conventions
#' @name gen_args
#' @inheritParams formatters::format_value
#' @family conventions
#' @param df dataset (data.frame or tibble)
#' @param alt_counts_df dataset (data.frame or tibble). Alternative full data
#'   the rtables framework will use (\emph{only}) when calculating column
#'   counts.
#' @param spl A Split object defining a partitioning or analysis/tabulation of
#'   the data.
#' @param pos numeric.  Which top-level set of nested splits should the new
#'   layout feature be added to. Defaults to the current
#' @param tt TableTree (or related class). A TableTree object representing a
#'   populated table.
#' @param tr TableRow (or related class). A TableRow object representing a
#'   single row within a populated table.
#' @param verbose logical. Should additional information be displayed to the
#'   user. Defaults to FALSE.
#' @param colwidths numeric vector. Column widths for use with vertical pagination.
#' @param obj ANY. The object for the accessor to access or modify
#' @param x An object
#' @param \dots Passed on to methods or tabulation functions.
#' @param value The new value
#' @param object The object to modify in-place
#' @param verbose logical(1). Should extra debugging messages be shown. Defaults
#'   to \code{FALSE}.
#' @param path character. A vector path for a position within the structure of a
#'   tabletree. Each element represents a subsequent choice amongst the children
#'   of the previous choice.
#' @param label character(1). A label (not to be confused with the name) for the
#'   object/structure.
#' @param label_pos character(1). Location the variable label should be
#'   displayed, Accepts  hidden (default for non-analyze row splits), visible,
#'   topleft, and - for analyze splits only - default.  For analyze calls,
#'   \code{default} indicates that the variable should be visible if and only if
#'   multiple variables are analyzed at the same level of nesting.
#' @param cvar character(1). The variable, if any, which the content function
#'   should accept. Defaults to NA.
#' @param topleft character. Override values for the "top left" material to be
#'   displayed during printing.
#' @param page_prefix character(1). Prefix, to be appended with the split value,
#'   when forcing pagination between the children of this split/table
#' @param hsep character(1). Set of character(s) to be repeated as the separator
#'   between the header and body of the table when rendered as text. Defaults to
#'   a connected horizontal line (unicode 2014) in locals that use a UTF
#'   charset, and to `-` elsewhere (with a once per session warning).
#' @param indent_size numeric(1). Number of spaces to use per indent level.
#'   Defaults to 2
#' @param section_div character(1). String which should be repeated as a section
#'   divider after each group defined by this split instruction, or
#'   `NA_character_` (the default) for no section divider.
#' @param inset numeric(1). Number of spaces to inset the table header, table
#' body, referential footnotes, and main_footer, as compared to alignment
#' of title, subtitle, and provenance footer. Defaults to 0 (no inset).
#' @param table_inset numeric(1). Number of spaces to inset the table header, table
#' body, referential footnotes, and main_footer, as compared to alignment
#' of title, subtitle, and provenance footer. Defaults to 0 (no inset).
#' @return NULL (this is an argument template dummy function)
#' @rdname gen_args
gen_args <- function(df, alt_counts_df, spl, pos, tt, tr, verbose, colwidths, obj, x,
                     value, object, path, label, label_pos, # visible_label,
                     cvar, topleft, page_prefix, hsep, indent_size, section_div, na_str, inset,
                     table_inset,
                     ...) NULL



#' Layouting Function Arg Conventions
#' @name lyt_args
#' @rdname lyt_args
#' @inheritParams gen_args
#' @param lyt layout object pre-data used for tabulation
#' @param var string, variable name
#' @param vars character vector. Multiple variable names.
#' @param var_labels character. Variable labels for 1 or more variables
#' @param labels_var string, name of variable containing labels to be displayed
#'   for the values of \code{var}
#' @param varlabels character vector. Labels for \code{vars}
#' @param varnames character vector. Names for \code{vars} which will appear in
#'   pathing. When \code{vars} are all unique this will be the variable names.
#'   If not, these will be variable names with suffixes as necessary to enforce
#'   uniqueness.
#' @param split_format FormatSpec. Default format associated with the split
#'   being created.
#' @param split_na_str character. NA string vector for use with \code{split_format}.
#' @param split_label string. Label string to be associated with the table
#'   generated by the split. Not to be confused with labels assigned to each
#'   child (which are based on the data and type of split during tabulation).
#' @param nested boolean. Should this layout instruction be applied within the
#'   existing layout structure \emph{if possible} (`TRUE`, the default) or as a
#'   new top-level element (`FALSE). Ignored if it would nest a split underneath
#'   analyses, which is not allowed.
#' @param format FormatSpec. Format associated with this split. Formats can be
#'   declared via strings (\code{"xx.x"}) or function. In cases such as
#'   \code{analyze} calls, they can character vectors or lists of functions.
#' @param align character(1) or `NULL`. Alignment the value should be rendered with.
#'   It defaults to `"center"` if `NULL` is used. See \code{\link{rtables_aligns}} 
#'   for currently supported alignments.
#' @param cfun list/function/NULL. tabulation function(s) for creating content
#'   rows. Must accept \code{x} or \code{df} as first parameter. Must accept
#'   \code{labelstr} as the second argument. Can optionally accept all optional
#'   arguments accepted by analysis functions. See \code{\link{analyze}}.
#' @param cformat format spec. Format for content rows
#' @param cna_str character. NA string for use with \code{cformat} for content
#'   table.
#' @param split_fun function/NULL. custom splitting function See
#'   \code{\link{custom_split_funs}}
#' @param split_name string. Name associated with this split (for pathing, etc)
#' @param afun function. Analysis function, must take \code{x} or \code{df} as
#'   its first parameter. Can optionally take other parameters which will be
#'   populated by the tabulation framework. See Details in
#'   \code{\link{analyze}}.
#' @param inclNAs boolean. Should observations with NA in the \code{var}
#'   variable(s) be included when performing this analysis. Defaults to
#'   \code{FALSE}
#' @param valorder character vector. Order that the split children should appear
#'   in resulting table.
#' @param ref_group character. Value of \code{var} to be taken as the
#'   ref_group/control to be compared against.
#' @param compfun function/string. The comparison function which accepts the
#'   analysis function outputs for two different partitions and returns a single
#'   value. Defaults to subtraction. If a string, taken as the name of a
#'   function.
#' @param label_fstr string. An sprintf style format string containing. For
#'   non-comparison splits, it can contain  up to one \code{"\%s"} which takes
#'   the current split value and generates the row/column label.
#'   Comparison-based splits it can contain up to two \code{"\%s"}.
#' @param child_labels string. One of \code{"default"}, \code{"visible"},
#'   \code{"hidden"}. What should the display behavior be for the  labels (ie
#'   label rows) of the children of this split. Defaults to \code{"default"}
#'   which flags the label row as visible only if the child has 0 content rows.
#' @param extra_args list. Extra arguments to be passed to the tabulation
#'   function. Element position in the list corresponds to the children of this
#'   split. Named elements in the child-specific lists are ignored if they do
#'   not match a formal argument of the tabulation function.
#' @param name character(1). Name of the split/table/row being created. Defaults
#'   to same as the corresponding label, but is not required to be.
#' @param cuts numeric. Cuts to use
#' @param cutlabels character (or NULL). Labels for the cuts
#' @param cutlabelfun function. Function which returns either labels for the
#'   cuts or NULL when passed the return value of \code{cutfun}
#' @param cumulative logical. Should the cuts be treated as cumulative. Defaults
#'   to \code{FALSE}
#' @param cutfun function. Function which accepts the \emph{full vector} of
#'   \code{var} values and returns cut points to be used (via \code{cut}) when
#'   splitting data during tabulation
#' @param indent_mod numeric. Modifier for the default indent position for the
#'   structure created by this function(subtable, content table, or row)
#'   \emph{and all of that structure's children}. Defaults to 0, which
#'   corresponds to the unmodified default behavior.
#' @param show_labels character(1). Should the variable labels for corresponding
#'   to the variable(s) in \code{vars} be visible in the resulting table.
#' @param table_names character. Names for the tables representing each atomic
#'   analysis. Defaults to \code{var}.
#' @param page_by logical(1). Should pagination be forced between different
#'   children resulting form this split.
#' @param format_na_str character(1). String which should be displayed when
#'   formatted if this cell's value(s) are all NA.
#' @inherit gen_args return
#' @family conventions
lyt_args <- function(lyt, var, vars, label, labels_var, varlabels, varnames, split_format,
                     split_na_str, nested, format, cfun, cformat, cna_str, split_fun,
                     split_name, split_label, afun, inclNAs, valorder,
                     ref_group, compfun, label_fstr, child_labels, extra_args, name,
                     cuts, cutlabels, cutfun, cutlabelfun, cumulative,
                     indent_mod, show_labels, label_pos, #visible_label,
                     var_labels, cvar,
                     table_names, topleft, align, page_by, page_prefix,
                     format_na_str, section_div, na_str) NULL


#' Constructor Arg Conventions
#' @name constr_args
#' @family conventions
#' @inherit gen_args return
#'
#' @inheritParams gen_args
#' @inheritParams lyt_args
#' @param kids list. List of direct children.
#' @param cont ElementaryTable. Content table.
#' @param lev integer. Nesting level (roughly, indentation level in practical
#'   terms).
#' @param iscontent logical. Is the TableTree/ElementaryTable being constructed
#'   the content table for another TableTree.
#' @param cinfo InstantiatedColumnInfo (or NULL). Column structure for the
#'   object being created.
#' @param labelrow LabelRow. The LabelRow object to assign to this Table.
#'   Constructed from \code{label} by default if not specified.
#' @param vals list. cell values for the row
#' @param cspan integer. Column span. \code{1} indicates no spanning.
#' @param cindent_mod numeric(1). The indent modifier for the content tables
#'   generated by this split.
#' @param cextra_args list. Extra arguments to be passed to the content function
#'   when tabulating row group summaries.
#' @param child_names character. Names to be given to the sub splits contained
#'   by a compound split (typically a AnalyzeMultiVars split object).
#' @param title character(1). Main title. Ignored for subtables.
#' @param subtitles character. Subtitles. Ignored for subtables.
#' @param main_footer character. Main global (non-referential) footer materials.
#' @param prov_footer character. Provenance-related global footer materials.
#'   Generally should not be modified by hand.
#' @param footnotes list or NULL. Referential footnotes to be applied at current
#'   level
#' @param trailing_sep character(1). String which will be used as a section
#'   divider after the printing of the last row contained in this (sub)-table,
#'   unless that row is also the last table row to be printed overall, or
#'   `NA_character_` for none (the default). When generated via layouting, this
#'   would correspond to the `section_div` of the split under which this table
#'   represents a single facet.
#' @param page_title character. Page specific title(s).
#' @rdname constr_args
constr_args <- function(kids, cont, lev, iscontent, cinfo, labelrow, vals,
                        cspan, label_pos, cindent_mod, cvar, label, cextra_args,
                        child_names, title, subtitles, main_footer, prov_footer,
                        footnotes, page_title, page_prefix, section_div,
                        trailing_sep, split_na_str,
                        cna_str, inset, table_inset) NULL

#' Compatibility Arg Conventions
#' @name compat_args
#' @family conventions
#' @inherit gen_args return
#' @inheritParams gen_args
#' @param .lst list. An already-collected list of arguments to be used instead
#'   of the elements of \code{\dots}. Arguments passed via \code{\dots} will be
#'   ignored if this is specified.
#' @param row.name if \code{NULL} then an empty string is used as 
#'   \code{row.name} of the \code{\link{rrow}}.
#' @param format character(1) or function. The format label (string) or 
#'   formatter function to apply to the cell values passed via `...`. See 
#'   \code{\link[formatters]{list_valid_format_labels}} for currently supported 
#'   format labels.
#' @param indent deprecated.
#' @param inset integer(1). The table inset for the row or table being
#'   constructed. See \code{\link[formatters]{table_inset}}.
#' @rdname compat_args
compat_args <- function(.lst, row.name, format, indent, label, inset) NULL



#' Split Function Arg Conventions
#' @name sf_args
#' @family conventions
#' @inherit gen_args return
#'
#' @inheritParams gen_args
#' @param trim logical(1). Should splits corresponding with 0 observations be
#'   kept when tabulating.
#' @param first logical(1). Should the created split level be placed first in
#'   the levels (\code{TRUE}) or last (\code{FALSE}, the default).
#'
sf_args <- function(trim, label, first) NULL

# nocov end
