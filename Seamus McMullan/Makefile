TITLE=Chordbook
AUTHOR=Seamus\ McMullan

all: clean Chordbook.pdf

clean:
	rm -f Chordbook.pdf

Chordbook.pdf:
	chordii -a -i -P letter *.pro | \
		sed -e "s/A nicely formatted song sheet/$(TITLE)/;" | \
		sed -e "s/%%Creator:/%%Author: $(AUTHOR)\n%%Creator:/;" | \
		ps2pdf - "Chordbook.pdf"

