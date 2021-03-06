% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_crossing_block.R
\name{sim_crossing_block}
\alias{sim_crossing_block}
\title{Create a crossing block from a vector of parents}
\usage{
sim_crossing_block(parents, second.parents, n.crosses,
  scheme = c("random", "chain"), use.parents.once = FALSE)
}
\arguments{
\item{parents}{A \code{character} of line names to use as parents. If
\code{second.parents} is not provided, crosses are assigned from randomly sampling
the entries in \code{parents}.}

\item{second.parents}{A \code{character} of line names to use as parents. If
passed, must be the same length as \code{parents}.}

\item{n.crosses}{The number of crosses to generate. Cannot be more than the
possible number of crosses.}

\item{scheme}{The mating scheme. Can be one of \code{"random"} or \code{"chain"}.
See \emph{Details} for more information.}

\item{use.parents.once}{\code{Logical} - should parents be used only once?}
}
\value{
A data.frame with two columns. The first is the names of the first parents, 
and the second is the name of the second parents. Each row is a mating pair.
}
\description{
Create a crossing block based on parent names, with different options for
mating scheme.
}
\details{
Several options are available to generate crossing blocks from a list of
parents. Here are the rules used for generating different crossing blocks.

\describe{
  \item{\code{scheme = "random"}}{A \code{data.frame} is first constructed with
  all possible pairwise combinations of \code{parents} and \code{second.parents}
  (see below for handling of \code{second.parents}). Self-crosses and reciprocal
  crosses are removed and \code{n.crosses} crosses are randomly sampled. If
  \code{use.parents.once = TRUE}, crosses are selected such that any one parent
  is used only once.}
  \item{\code{scheme = "chain"}}{Crosses are generated by pairing the first element
  in \code{parents} with the second element, the second element with the third,
  and so on. The \code{n.crosses} and \code{use.parents.once} arguments are ignored.}
}

Further rules:

\itemize{
  \item{If \code{second.parents = NULL}, then \code{parents} is duplicated.}
}
}
\examples{

parents <- paste("line", seq(10), sep = "")

# Generate 3 crosses randomly
cb <- sim_crossing_block(parents = parents, n.crosses = 3)

# Generate 3 crosses randomly, while only using parents once
cb <- sim_crossing_block(parents = parents, n.crosses = 3, use.parents.once = T)

# Generate a chain of crosses
cb <- sim_crossing_block(parents = parents, scheme = "chain")

## Use another vector of parents
second.parents <- paste("line", seq(11, 20), sep = "")

cb <- sim_crossing_block(parents = parents, second.parents = second.parents, n.crosses = 3)

# When using scheme = "chain", second.parents is ignored
cb <- sim_crossing_block(parents = parents, second.parents = second.parents, scheme = "chain")

}
