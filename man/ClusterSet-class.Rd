% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClusterSet_class.R
\docType{class}
\name{ClusterSet-class}
\alias{ClusterSet-class}
\title{ClusterSet}
\value{
A ClusterSet object.
}
\description{
This class is a representation of a partitioning algorithm and is intented to store gene clusters.
}
\section{Slots}{

\describe{
\item{\code{name}}{character. The original input file name (if applicable).}

\item{\code{data}}{matrix. The matrix containing the filtered/partitionned data.}

\item{\code{distances}}{vector. The observed distance values with the knn.}

\item{\code{simulated_distances}}{vector. The simulated distance values with the knn.}

\item{\code{critical_distance}}{vector. The critical threshold distance to select informative genes.}

\item{\code{cluster}}{vector. Mapping of row/genes to clusters.}

\item{\code{size}}{vector. The size of each cluster.}

\item{\code{dot_prodcut}}{vector. The median dot product of each gene clusters.}

\item{\code{top_genes}}{matrix The highly co-expressed genes of each gene clusters.}

\item{\code{center}}{matrix. The centers of each clusters.}

\item{\code{parameters}}{list. The parameter used.}

\item{\code{algorithm}}{vector. The algorithm used to produce the clusters.}

\item{\code{cell_types}}{vector. The cell types.}

\item{\code{cell_colors}}{vector. The cell types to color mapping.}

\item{\code{cell_order}}{vector. How cell should be ordered.}

\item{\code{cluster_annotations}}{list. Functional annotation of clusters.}
}}

\examples{

\dontrun{
  m <- matrix(rnorm(80000), nc=20)
   m[1:100,1:10] <- m[1:100,1:10] + 4
   m[101:200,11:20] <- m[101:200,11:20] + 3
   m[201:300,5:15] <- m[201:300,5:15] + -2
   res <- DBFMCL(data=m,
                 distance_method="pearson",
                 av_dot_prod_min = 0,
                 inflation = 1.2,
                 k=25,
                 fdr = 10)
plot_clust(res, ceil = 10, floor = -10)
plot_clust(res, type="tile", ceil = 10, floor = -10)
write_clust(res, filename_out = "ALL.sign.txt")
  is(res)
}
              
}
