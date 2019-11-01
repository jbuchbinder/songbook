#!/bin/bash

for PRO in "$@"; do
	XTITLE=$(grep -E '^{t:'   "$PRO" | cut -d: -f2 | cut -d'}' -f1)
	XAUTHOR=$(grep -E '^{st:' "$PRO" | cut -d: -f2 | cut -d'}' -f1)
	PREFIX="${PRO//.pro}"
	PDF="${PREFIX}.pdf"
	PDFLYRICS="${PREFIX} (lyrics).pdf"
	chordii -a -P letter "$PRO" | \
		sed -e "s/A nicely formatted song sheet/${XTITLE}/;" | \
		sed -e "s/%%Creator:/%%Author: ${XAUTHOR}\n%%Creator:/;" | \
		ps2pdf - "$PDF"
	chordii -l -t 20 -P letter "$PRO" | \
		sed -e "s/A nicely formatted song sheet/${XTITLE}/;" | \
		sed -e "s/%%Creator:/%%Author: ${XAUTHOR}\n%%Creator:/;" | \
		ps2pdf - "$PDFLYRICS"
done

