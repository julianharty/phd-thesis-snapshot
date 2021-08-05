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

## Editing notes
The thesis is written in UK English and uses Oxford commas. There are many comments in the latex source which do not appear in the generated thesis.

### Structure of the project
* appendicies: non-core materials. Some are already excluded from the generated thesis, others form part of it.
* case-studies: currently a mixed bag of case studies that were performed during the research. These will be pared down as the thesis reaches maturity and subject to permissions and approvals some may similarly be included or excluded from the thesis.
* draftmaterials: Older materials, notes, brain-farts, etc. Excluded from the thesis.
* examples: these came from a previous thesis that used this template. They're there for inspiration in the microcosm of latex.
* frontmatter: contains the boilerplate and preamble for this thesis.
* images: the many images are gathered here. Not all are included in the thesis. There are also additional images hosted separately e.g. in PowerPoint documents that may be included as and when they're perceived to add to the thesis. The images folder contains various sub-folders, I hope they're identifiable. 
* mainchapters: here's the core of the thesis (when combined with the case studies).
* meta-chapters: mainly commentary about and related to the thesis and the underlying research.
* references: mainly the bibliography files.
* utilities: written in basic bash files to help quantify the source files in the thesis.
* various files are in the root folder including: print_a_chapter.tex - used to help focus on a subset of the thesis, thesis.tex - generates the thesis with the contents intended for eventual submission, and thesis-with-extras.tex which additionally includes some of the meta-chapters.