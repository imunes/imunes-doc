
TARGET = document
HTML_TARGET = html_document
VISAK = *.aux *.idx *.log *.toc *.out *.dvi
HTML_VISAK = ${HTML_TARGET}.pdf ${HTML_TARGET}.idx \
	     ${HTML_TARGET}.log ${HTML_TARGET}.toc \
	     ${HTML_TARGET}.out ${HTML_TARGET}.dvi

all: ${TARGET}.tex
	pdflatex ${TARGET}.tex
	pdflatex ${TARGET}.tex
	pdflatex ${TARGET}.tex
	cp ${TARGET}.pdf IMUNES_manual.pdf

cleanAll:
	-rm -rf ${VISAK} ${HTML_VISAK} ${TARGET}.pdf ${HTML_TARGET}

clean:
	-rm -rf ${VISAK} ${HTML_VISAK}

html: ${HTML_TARGET}.tex
	pdflatex ${HTML_TARGET}.tex
	-rm -f ${HTML_VISAK}
	latex2html -t "IMUNES manual" -show_section_numbers -split 3 ${HTML_TARGET}.tex
	cp ${HTML_TARGET}.css ${HTML_TARGET}
	cd ${HTML_TARGET} && sed -i"" -e 's#file:/usr/local/share/latex2html/icons/##' *.html
	cp html_images/* ${HTML_TARGET}

