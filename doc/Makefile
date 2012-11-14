#
# Makefile for pkgix documentation
#

PROGNAME = pkgix
DESTDIR = /usr/local
MANDIR = share/man
_MANDIR = ../$(MANDIR)
RST2MAN = rst2man

MAN_DOCS = $(_MANDIR)/man1/$(PROGNAME).1

all: man
man: $(MAN_DOCS)

.PHONY: all man

$(_MANDIR)/man1/%.1: %.1.rst
	mkdir -p "$(shell dirname "$@")"
	sed "s/@DATE@/$$(date "+%Y-%m-%d")/"$$'\n'"s/@VERSION@/$$(../bin/$(PROGNAME) -V | head -n 1)/" "$<" | $(RST2MAN) "-" "$@"

clean-man:
	rm -f "$(MAN_DOCS)"

clean: clean-man

.PHONY: clean-man clean

install-gzipped-man: man
	mkdir -p "$(DESTDIR)/$(MANDIR)/man1"
	gzip < "$(_MANDIR)/man1/$(PROGNAME).1" > "$(DESTDIR)/$(MANDIR)/man1/$(PROGNAME).1.gz"

install: install-gzipped-man

.PHONY: install-gzipped-man install

