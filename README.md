# phd-thesis
Julian Harty's work-in-progress PhD thesis.
This repo is created and sync'd with Overleaf.

## Working offline
A combination of the [atom editor](https://atom.io), Homebrew, pygmentize, and innumerable tlmgr installs provided the foundations. Shell escape also needs to be enabled in at least one place in the configuration of atom-latex (one of several packages I installed into the atom editor).

![Enable shell-escape](https://github.com/julianharty/phd-thesis/blob/master/atom-latex-add-shell-escape-to-command-lines.png "Enable shell-escape command line flag in atom-latex")

I also learned just enough awk to process the latex_configuration.tex file to identify many of the packages that needed installing using tlmgr. For whatever reason I needed to use `sudo` to install packages with tlmgr. Here's an unrefined version of the script to run to install the latex packages [utilities/install_latex_packages.sh](https://github.com/julianharty/phd-thesis/blob/master/utilities/install_latex_packages.sh)

I also needed to download a local copy of `ACM-Reference-Format.bst` before the bibliography was generated locally. I don't know how Overleaf deals with this aspect. I have not yet checked in this file to the repo in case it causes Overleaf problems generating the bibliography.


Here's a partial list of the commands run
```
brew install basictex

sudo tlmgr install zref
sudo tlmgr install tabu
sudo tlmgr install minifp


pdflatex -synctex=1 -interaction=nonstopmode  -shell-escape  -file-line-error print_a_chapter.tex
```
