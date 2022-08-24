
tlmgr list --only-installed
# Command to build the first part of this list is
# awk 'BEGIN { RS = "\usepackage" }
     { print  substr($1, 1, length($1)-1) }' latex-configuration.tex | awk 'BEGIN {RS = "{" } !/^\[[a-z]*\]/{print "sudo tlmgr install " $1}' > utilities/install_latex_packages.sh
# However it doesn't find all the packages and some of the commands it created didn't suit tlmgr
# The next challenge is to enable pdflatex to process the bibliography files which it currently seems to ignore.

In vim:

I manually converted comma separated packages into separate entries of sudo tlmgr install whatever

Two commands can help clean up the packages list
:%s# \+# #g replaces mixed whitespace with consistent whitespace, in preparation for sorting.
https://superuser.com/a/719186/210029

:%!sort | uniq -u
https://superuser.com/questions/544797/vim-delete-all-lines-but-unique#:~:text=2-,%3A%25!sort%20%7C%20uniq%20%2Du,-will%20do%20just

