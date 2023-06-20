all: jpi_cv.html jpi_cv.pdf jpi_cv.txt

jpi_cv.html: jpi_cv.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o jpi_cv.html jpi_cv.md

jpi_cv.pdf: jpi_cv.html
	wkhtmltopdf --enable-local-file-access jpi_cv.html jpi_cv.pdf

jpi_cv.txt: jpi_cv.md
	pandoc --standalone -f markdown-smart --from markdown --to plain -o jpi_cv.txt jpi_cv.md

update_web:
	./update_web.sh

clean:
	rm -f *.html *.pdf *.docx *.txt *~
