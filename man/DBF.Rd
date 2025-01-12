% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbfmcl_main.R
\name{DBF}
\alias{DBF}
\title{DBF}
\usage{
DBF(
  data,
  output_path = ".",
  name = NULL,
  distance_method = "pearson",
  silent = FALSE,
  k = 100,
  fdr = 10,
  seed = 123
)
}
\arguments{
\item{data}{a matrix or data.frame}

\item{output_path}{a character string representing the data directory where
output files will be stored. Default to current working directory.}

\item{name}{a prefix for the file name}

\item{distance_method}{a method to compute the distance to the k-th nearest
neighbor.}

\item{silent}{if set to TRUE (default), the progression of distance matrix
calculation is not displayed.}

\item{k}{the neighborhood size.}

\item{fdr}{a value for the false discovery rate.}

\item{seed}{specify seeds for random number generator.}
}
\description{
This function is an internal function used by \code{\link{DBFMCL}} to detect
informative elements (\emph{i.e.}, those that belong to dense regions). User
should not use this function. Instead they can use the \code{\link{DBFMCL}}
function with \code{clustering} argument set to \code{FALSE}.

See \code{\link{DBFMCL}}
}
\section{Warnings}{
 Works only on UNIX-alikes platforms.
}

\references{
Lopez F.,Textoris J., Bergon A., Didier G., Remy E., Granjeaud
S., Imbert J. , Nguyen C. and Puthier D. TranscriptomeBrowser: a powerful
and flexible toolbox to explore productively the transcriptional landscape
of the Gene Expression Omnibus database. PLoSONE, 2008;3(12):e4001.
}
\seealso{
\code{\link{DBFMCL}}
}
\author{
Bergon A., Bavais J., Textoris J., Granjeaud S., Lopez F and Puthier
D.
}
\keyword{manip}
