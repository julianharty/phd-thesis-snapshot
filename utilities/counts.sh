# Various commands to help me analyse my writing

# count the number of footnotes in each tex file
# useful to know if I'm overdoing footnotes vs citations
echo "=== Footnotes per file, sorted numerically by count."
grep -r -c -i \footnote --include \*.tex * | sort -t : -k 2 -n

# count the number of citations in each tex file
# useful to find files lacking citations c.f. code coverage mantra
echo "=== Citation counts per file, sorted numerically by count."
grep -r -c -i \cite --include \*.tex * | sort -t : -k 2 -n

# get word and line counts in each tex file
echo "=== Show word counts per file, sorted numerically by line count."
find . -name "*.tex" | xargs wc | sort -n