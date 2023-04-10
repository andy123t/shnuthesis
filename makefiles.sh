#!/bin/bash

#-> Get source file
find . -maxdepth 1 -type f -name "*.tex" | while read file; do 
#--- Process file.tex ---
echo "$file"
echo "${file%.tex}"
#-> Compile the main file
xelatex --synctex=-1 "$file"
bibtex "${file%.tex}"
xelatex --synctex=-1 "$file"
xelatex --synctex=-1 "$file"
#-> Clear aux files
rm -r *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb 
done
