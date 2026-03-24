all: jpi_cv.html jpi_cv.pdf jpi_cv.txt

# Default build uses full contact details (original markdown)
jpi_cv.html: jpi_cv.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o jpi_cv.html jpi_cv.md

jpi_cv.pdf: jpi_cv.html
	weasyprint jpi_cv.html jpi_cv.pdf

jpi_cv.txt: jpi_cv.md
	pandoc --standalone -f markdown-smart --from markdown --to plain -o jpi_cv.txt jpi_cv.md

# Create no-contact variant for web by removing <br> and after in banner line
jpi_cv_no_contact.md: jpi_cv.md
	sed '/^### / s/<br>.*//' jpi_cv.md > jpi_cv_no_contact.md

update_web: jpi_cv_no_contact.md
	# Use no-contact markdown for web builds
	pandoc --standalone -c style.css --from markdown --to html -o jpi_cv.html jpi_cv_no_contact.md
	weasyprint jpi_cv.html jpi_cv.pdf
	pandoc --standalone -f markdown-smart --from markdown --to plain -o jpi_cv.txt jpi_cv_no_contact.md

	./.update_web.sh push

clean:
	rm -f *.html *.pdf *.txt

