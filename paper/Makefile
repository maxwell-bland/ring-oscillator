all:
	pdflatex burning.tex
	bibtex burning
	pdflatex burning.tex
	pdflatex burning.tex

clean:
	rm *.aux *.pdf *.log *.out *.cut > /dev/null 2>&1
