% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualization.R
\name{viz_dist}
\alias{viz_dist}
\title{viz_dist}
\usage{
viz_dist(
  object,
  line_type = c("solid", "longdash"),
  line_color = c("#006D77", "#83C5BE"),
  line_size = c(1, 0.8),
  vline_type = "dotdash",
  vline_color = "#E29578",
  vline_size = 0.5,
  text_size = 4,
  text_hjust = -0.8,
  text_vjust = -0.5
)
}
\arguments{
\item{object}{A ClusterSet object.}

\item{line_type}{A vector of character defining the line type for the observed distance line and the simulated distance line.}

\item{line_color}{A vector of numeric defining the color for the observed distance line and the simulated distance line.}

\item{line_size}{A vector of numeric defining the size for the observed distance line and the simulated distance line.}

\item{vline_type}{Type of vertical line.}

\item{vline_color}{Color of vertical line.}

\item{vline_size}{Size of vertical line}

\item{text_size}{Size of vertical line text}

\item{text_hjust}{Horizontal position adjustment of vertical line text.}

\item{text_vjust}{Vertical position adjustment of vertical line text
input file containing distances and cutting threshold is stored. 
Default to current working directory.}
}
\value{
A ggplot diagram.
}
\description{
Plot the observed and simulated distance with the Kth nearest neighbors.
}
\examples{
# see online examples
}
