PANDOC ?= pandoc
WEASYPRINT ?= weasyprint
REFDOC ?= templates/aei-reference.docx
SRC ?= jpi_cv.md
STYLE ?= style.css

.PHONY: all academic web aei clean test_aei

all: academic

academic: jpi_cv.html jpi_cv.pdf jpi_cv.txt

jpi_cv.html: $(SRC) $(STYLE)
	$(PANDOC) --standalone -c $(STYLE) --from markdown --to html -o $@ $(SRC)

jpi_cv.pdf: jpi_cv.html
	$(WEASYPRINT) jpi_cv.html jpi_cv.pdf

jpi_cv.txt: $(SRC)
	$(PANDOC) --standalone -f markdown-smart --from markdown --to plain -o $@ $(SRC)

jpi_cv_no_contact.md: $(SRC)
	sed '/^### / s/<br>.*//' $(SRC) > $@

web: jpi_cv_no_contact.md $(STYLE)
	$(PANDOC) --standalone -c $(STYLE) --from markdown --to html -o jpi_cv.html jpi_cv_no_contact.md
	$(WEASYPRINT) jpi_cv.html jpi_cv.pdf
	$(PANDOC) --standalone -f markdown-smart --from markdown --to plain -o jpi_cv.txt jpi_cv_no_contact.md
	./.update_web.sh push

aei: jpi_cv_aei.docx

jpi_cv_aei.docx: $(SRC) $(REFDOC)
	$(PANDOC) \
	  --from markdown \
	  --to docx \
	  --reference-doc=$(REFDOC) \
	  -o $@ \
	  $(SRC)

test_aei: jpi_cv_aei.docx

clean:
	rm -f *.html *.pdf *.txt *.docx jpi_cv_no_contact.md
