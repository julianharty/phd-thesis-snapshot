# phd-thesis
Julian Harty's work-in-progress PhD thesis.
This repo is created and sync'd with Overleaf.

## Working offline
A combination of the [atom editor](https://atom.io), Homebrew, pygmentize, and innumerable tlmgr installs provided the foundations. Shell escape also needs to be enabled in at least one place in the configuration of atom-latex (one of several packages I installed into the atom editor).

![Enable shell-escape](https://github.com/julianharty/phd-thesis/blob/master/atom-latex-add-shell-escape-to-command-lines.png "Enable shell-escape command line flag in atom-latex")

I also learned just enough awk to process the latex_configuration.tex file to identify many of the packages that needed installing using tlmgr. For whatever reason I needed to use `sudo` to install packages with tlmgr. Here's an unrefined version of the script to run to install the latex packages [utilities/install_latex_packages.sh](https://github.com/julianharty/phd-thesis/blob/master/utilities/install_latex_packages.sh)

I also needed to download a local copy of `ACM-Reference-Format.bst` before the bibliography was generated locally. I don't know how Overleaf deals with this aspect. I have not yet checked in this file to the repo in case it causes Overleaf problems generating the bibliography.


Here's a partial list of the commands run

Install pygmentize using Python 3's pip3 command:
`pip3 -v install pygments`

Run the script `utilities/install_latex_packages.sh` after installing Homebrew and using it to `brew install basictex`

There's probably software to install in addition to all this, anyway once all the software and packages have been installed,

`time latexmk -r LatexMk  thesis` should time the command needed to compile the thesis.

### Older material, useful for debugging ###

```
brew install basictex

sudo tlmgr install zref
sudo tlmgr install tabu
sudo tlmgr install minifp


pdflatex -synctex=1 -interaction=nonstopmode  -shell-escape  -file-line-error print_a_chapter.tex
```

The compilation may fail, if so, the following command line will extract the name of the missing file and build a basic command string we can run to find which package it's likely to be found in:

```
pdflatex -synctex=1 -interaction=nonstopmode  -shell-escape  -file-line-error thesis.tex | grep 'LaTeX Error' |  awk -F"[\`\']" '{print "tlmgr info ", $2}'
```
For example after about 30 compilation errors it spat out:
`tlmgr info  nextpage.sty`

However the real challenge is to find out which packages to install, especially as sometimes there isn't a one-to-one match. For example, to find: `mathalfa.sty`

```
tlmgr info mathalfa.sty
```
returns:
```
tlmgr: cannot find package mathalfa.sty, searching for other matches:

Packages containing `mathalfa.sty' in their title/description:

Packages containing files matching `mathalfa.sty':
mathalpha:
	texmf-dist/tex/latex/mathalpha/mathalfa.sty
```
And means we can install the relevant package,
```
sudo tlmgr install mathalpha
```

## Editing notes
The thesis is written in UK English and uses Oxford commas. There are many comments in the latex source which do not appear in the generated thesis.

### Structure of the project
* appendicies: non-core materials. Some are already excluded from the generated thesis, others form part of it.
* case-studies: currently a mixed bag of case studies that were performed during the research. These will be pared down as the thesis reaches maturity and subject to permissions and approvals some may similarly be included or excluded from the thesis.
* outtakes: Older materials, notes, brain-farts, etc. Excluded from the thesis.
* examples: these came from a previous thesis that used this template. They're there for inspiration in the microcosm of latex.
* frontmatter: contains the boilerplate and preamble for this thesis.
* images: the many images are gathered here. Not all are included in the thesis. There are also additional images hosted separately e.g. in PowerPoint documents that may be included as and when they're perceived to add to the thesis. The images folder contains various sub-folders, I hope they're identifiable.
* mainchapters: here's the core of the thesis (when combined with the case studies).
* meta-chapters: mainly commentary about and related to the thesis and the underlying research.
* references: mainly the bibliography files.
* utilities: written in basic bash files to help quantify the source files in the thesis.
* various files are in the root folder including: print_a_chapter.tex - used to help focus on a subset of the thesis, thesis.tex - generates the thesis with the contents intended for eventual submission, and thesis-with-extras.tex which additionally includes some of the meta-chapters.


### Bibliographic notes
The bibliography stretches over several physical files:
* The core bibliography
* A bibliography for commentary on my research
* An excluded bibliography, which I recently created to track papers I've chosen not to include (for now). This is intended to streamline my tracking of what I've looked at so I don't inadvertently keep reading the same material months apart without recognising I've already decided it wasn't suitable when I read it previously
* An imported bibliography from the logging paper co-written and published at MOBILESoft 2021

A significant portion of the references have not yet been cited in my thesis yet. I've just decided to add a prefix of `yet_to_cite` to those I know I've not yet cited. The aim is to easily identify these papers so they can be referenced, or moved to the excluded bibliography file.

### Speeding up the latex compilation
As the thesis matured the compilations of the thesis started failing as they timed-out on Overleaf after their 4 minute limit for paid accounts (1 minute for free accounts). They provide several articles online for self-help to revise the content so it compiles faster.
* General overview https://www.overleaf.com/learn/how-to/Why_do_I_keep_getting_the_compile_timeout_error_message%3F
* Specifics for large images (I had several) https://www.overleaf.com/learn/how-to/Optimising_very_large_image_files
* Here's how I worked out how to find the large images https://linuxize.com/post/find-large-files-in-linux/

```
find . -xdev -type f -size +1M
grep -ir --include=\*.tex eps} .
grep -ir --include=\*.tex png} .
for i in *.png; do img2pdf  "$i" --out "${i%.*}.pdf";done
```

### Word Counts in the thesis
The thesis needs to be less than 100,000 words. Overleaf provides a count, however it doesn't seem to always be accurate e.g. when I've writen more words and recompiled the counts stayed the same. They use texcount. Here's a local command that counts the words in the majority of the thesis (it doesn't count anything in the bibliography or glossary). 

` texcount mainchapters/kaobook* thesis.tex  appendicies/thematic-analysis.tex`
I also tried using a combination of:
```
pdftotext -layout thesis.pdf thesis.txt
wc thesis.tex
```
To get an approximate count to compare with.


