#################################################################
##    Define top_genes function for ClusterSet object
#################################################################

#' @title
#' Best co-expressed genes from each gene cluster
#' @description
#' Extract the highly co-expressed genes of each gene cluster.
#' @param object A \code{ClusterSet} object.
#' @param top A value for the number of the most similar genes in gene clusters.
#' @param cluster A vector of gene cluster identity.
#'
#' @return 
#' @export top_genes
#'
#' @examples
#' 
#' m <- matrix(rnorm(80000), nc=20)
#' m[1:100,1:10] <- m[1:100,1:10] + 4
#' m[101:200,11:20] <- m[101:200,11:20] + 3
#' m[201:300,5:15] <- m[201:300,5:15] + -2
#' 
#' res <- DBFMCL(data=m,
#'               distance_method="pearson",
#'               av_dot_prod_min = 0,
#'               inflation = 1.2,
#'               k=25,
#'               fdr = 10)
#'               
#'res <- top_genes(object = res, top=500, cluster="all")
#'res@top_genes
#' 
#' \dontrun{
#' ## with an artificial dataset
#'
#' m <- matrix(rnorm(80000), nc = 20)
#' res <- get_data_4_DBFMCL(data=m)
#' }
#' 

top_genes <- function(object,
                      top = 20,
                      cluster = "all") {
  
  if(unique(cluster == "all")) {
    cluster <- c(1:length(object@size))
  }
  
  # Display a warning message if there is less than n top genes in a gene cluster
  loop <- 0
  for (size in object@size[cluster]){
    loop <- 1 + loop
    if(top > size) {
      warning(paste0("Number of top genes is greater than the number of genes in cluster ", loop, ". All genes will be use and order by similarity rank."))
    }
  }
  
  # Initialization for the for loop
  clusters <- object@cluster
  l_cor_means <- list()
  genes_top <- matrix(ncol = top)
  
  # Extract top co-expressed genes for each gene cluster
  for (i in cluster) {
    #Extract gene names in cluster i
    genes <- names(clusters[which(clusters == i)])
    
    #Compute distances between genes in cluster i
    #Use the same distance used by DBFMCL
    dist_method <- object@parameters$distance_method
    
    if (dist_method == "pearson") {
      cor_genes <- cor(t(object@data[genes,]), method = "pearson")
      dist <- 1 - cor_genes
    }
    
    if(dist_method == "spearman") {
      cor_genes <- cor(t(object@data[genes,]), method = "spearman")
      dist <- 1 - cor_genes
    }
    
    if(dist_method == "euclidean") {
      dist <- as.matrix(dist(object@data[genes,], method = "euclidean", upper = TRUE, diag = TRUE))
      diag(dist) <- NA
    }
    
    
    #Compute mean correlation for each gene in cluster i
    dist_means <- colMeans(dist, na.rm = TRUE)
    dist_means <- dist_means[order(dist_means, decreasing = FALSE)]
    
    #Extract top genes with the highest correlation mean
    genes_top <- rbind(genes_top, names(dist_means[1:top]))
  }
  
  # Prepare genes_top matrix
  if (length(cluster) > 1) {
    genes_top <- genes_top[2:(length(cluster)+1),]
  } else {
    genes_top <- as.matrix(t(genes_top[2:(length(cluster)+1),]))
  }
  colnames(genes_top) <- make.names(rep("gene.top", top+1), unique=TRUE)[2:(top+1)]
  rownames(genes_top) <- make.names(rep("cluster", length(cluster)+1), unique=TRUE)[2:(length(cluster)+1)]
  
  # Put genes_top matrix in object@top_genes
  object@top_genes <- genes_top
  
  # Print
  print_msg(msg = "Results are stored in top_genes slot of ClusterSet object.",
            msg_type = "INFO")
  
  return(object)
}