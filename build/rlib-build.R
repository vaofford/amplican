instLib = commandArgs(T)[1]

r = getOption( "repos" ) # hard code the UK repo for CRAN
r[ "CRAN" ] = "http://cran.uk.r-project.org"
options( repos = r )
rm( r )

ipak <- function( pkg ){
  new.pkg <- pkg[ !( pkg %in% installed.packages()[, "Package"] ) ]
  if ( length( new.pkg ) )
    install.packages( new.pkg, ask = FALSE, lib = instLib, lib.loc = instLib )
  sapply( pkg, library, character.only = TRUE )
}

ipak_bioconductor <- function( pkg ){
  new.pkg <- pkg[ !( pkg %in% installed.packages()[, "Package"] ) ]
  if ( length( new.pkg ) )
    BiocManager::install( new.pkg, ask = FALSE, lib = instLib, lib.loc = instLib )
  sapply( pkg, library, character.only = TRUE )
}

ipak( c( "BiocManager" ) )
ipak_bioconductor( c( "ampliCan" ) )
