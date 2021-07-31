sudo tlmgr install silence
sudo tlmgr install xcolor
sudo tlmgr install array
sudo tlmgr install datetime
sudo tlmgr install ifpdf
sudo tlmgr install subfig
sudo tlmgr install algorithm
sudo tlmgr install minted
sudo tlmgr install listings
sudo tlmgr install multicol
sudo tlmgr install algpseudocode
sudo tlmgr install outlines
sudo tlmgr install pgfgantt
sudo tlmgr install rotating
sudo tlmgr install threeparttable
sudo tlmgr install todonotes
sudo tlmgr install nth
sudo tlmgr install soul
sudo tlmgr install longtable,booktabs,threeparttablex
sudo tlmgr install svg
sudo tlmgr install copyrightbox
sudo tlmgr install ulem
sudo tlmgr install wrapfig
sudo tlmgr install tcolorbox
sudo tlmgr install rotating
sudo tlmgr install lipsum
sudo tlmgr install fouriernc
sudo tlmgr install fontenc
sudo tlmgr install minitoc
sudo tlmgr install calc,soul,fourier
sudo tlmgr install import
sudo tlmgr install lipsum
sudo tlmgr install graphicx
sudo tlmgr install longtable,rotating
sudo tlmgr install inputenc
sudo tlmgr install colortbl
sudo tlmgr install wasysym
sudo tlmgr install mathrsfs
sudo tlmgr install float
sudo tlmgr install placeins
sudo tlmgr install verbatim
sudo tlmgr install upgree
sudo tlmgr install latexsym
sudo tlmgr install url
sudo tlmgr install babel
sudo tlmgr install color
sudo tlmgr install memhfixc
sudo tlmgr install enumerate
sudo tlmgr install footnote
sudo tlmgr install boxhandler
sudo tlmgr install microtype
sudo tlmgr install rotfloat
sudo tlmgr install alltt
sudo tlmgr install pgf
sudo tlmgr install adjustbox
sudo tlmgr install mdframed
sudo tlmgr install array,tabularx,longtable,tabu
sudo tlmgr install colortbl,tikz
sudo tlmgr install lettrine
sudo tlmgr install memhfixc
sudo tlmgr install CJKutf8
sudo tlmgr install arabtex
sudo tlmgr install utf8
sudo tlmgr install environ
sudo tlmgr install transparent
sudo tlmgr install fourier
sudo tlmgr install marvosym
sudo tlmgr install was
sudo tlmgr install pbox
sudo tlmgr install collectbox
sudo tlmgr install zref
sudo tlmgr install tabu
sudo tlmgr install minifp
sudo tlmgr install collection-fontsrecommended
sudo tlmgr install algorithmicx
sudo tlmgr install threeparttablex
sudo tlmgr install algpseudocodex
sudo tlmgr install multirow
sudo tlmgr install framed
sudo tlmgr install xstring
sudo tlmgr install catchfile
sudo tlmgr install fvextra
# Command to build the first part of this list is
# awk 'BEGIN { RS = "\usepackage" }       
     { print  substr($1, 1, length($1)-1) }' latex-configuration.tex | awk 'BEGIN {RS = "{" } !/^\[[a-z]*\]/{print "sudo tlmgr install " $1}' > utilities/install_latex_packages.sh

# The following seems to be the final version of the above command, at least according to my zsh history.
awk 'BEGIN { RS = "\usepackage" }     { print  substr($1, 1, length($1)-1) }' latex-configuration.tex | awk 'BEGIN {RS = "{" } !/^\[[a-z]*\]/{print "sudo tlmgr install " $1}' > utilities/install_latex_packages.sh
# However it doesn't find all the packages and some of the commands it created didn't suit tlmgr
# The next challenge is to enable pdflatex to process the bibliography files which it currently seems to ignore.
