#
# Makefile for pkgix
#

PROGNAME = pkgix
DESTDIR = /usr/local
PREFIX = $(DESTDIR)
LOCALEDIR = share/locale

MSGFMT = msgfmt -c

TRANSLATIONS = $(shell for po in `ls po`; do echo "$(LOCALEDIR)/$${po%%.po}/LC_MESSAGES/$(PROGNAME).mo"; done)

.PHONY: all
all: translations

.PHONY: translations
translations: $(TRANSLATIONS)

$(LOCALEDIR)/%/LC_MESSAGES/$(PROGNAME).mo: po/%.po
	mkdir -p $(shell dirname "$@")
	$(MSGFMT) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(LOCALEDIR)

install-gzipped-man:
	mkdir -p "$(DESTDIR)/share/man/man1"
	gzip < share/man/man1/$(PROGNAME).1 > "$(DESTDIR)/share/man/man1/$(PROGNAME).1.gz"

install-translations: translations
	for mo in $(TRANSLATIONS); do \
		install -Dm 0644 $$mo "$(DESTDIR)/$$mo" ;\
	done

install: install-gzipped-man install-translations
	install -Dm 0755 bin/$(PROGNAME) "$(DESTDIR)/bin/$(PROGNAME)"
	sed -i 's:^TEXTDOMAINDIR=.*$$:TEXTDOMAINDIR="$(PREFIX)/$(LOCALEDIR)":' "$(DESTDIR)/bin/$(PROGNAME)"
	install -Dm 0644 share/$(PROGNAME)/helper-inc.sh  "$(DESTDIR)/share/$(PROGNAME)/helper-inc.sh"

.PHONY: install-gzipped-man install-translations install

