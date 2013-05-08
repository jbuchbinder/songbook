TITLE=Chordbook
AUTHOR=Various

.SUFFIXES: .pro .pdf

all: clean Chordbook.pdf

clean:
	rm -f *.pdf

%.pdf : %.pro
	XTITLE  := $(shell fgrep '^{t:' $<  | cut -d: -f2 | cut -d'}' -f1)
	XAUTHOR := $(shell fgrep '^{st:' $< | cut -d: -f2 | cut -d'}' -f1)
	chordii -a -i -P letter "$<" | \
		sed -e "s/A nicely formatted song sheet/$(XTITLE)/;" | \
		sed -e "s/%%Creator:/%%Author: $(XAUTHOR)\n%%Creator:/;" | \
		ps2pdf - "$@"

Chordbook.pdf:
	chordii -a -i -P letter *.pro | \
		sed -e "s/A nicely formatted song sheet/$(TITLE)/;" | \
		sed -e "s/%%Creator:/%%Author: $(AUTHOR)\n%%Creator:/;" | \
		ps2pdf - "Chordbook.pdf"

