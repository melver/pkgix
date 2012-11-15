#
# Makefile for pkgix
#

PROGNAME = pkgix
DESTDIR = /usr/local
PREFIX = $(DESTDIR)
LOCALEDIR = share/locale
MANDIR = share/man

export PROGNAME
export DESTDIR
export PREFIX
export MANDIR

MSGFMT = msgfmt -c

TRANSLATIONS = $(shell cd po && for po in *.po; do echo "$(LOCALEDIR)/$${po%%.po}/LC_MESSAGES/$(PROGNAME).mo"; done)

all: translations doc
translations: $(TRANSLATIONS)
doc:
	$(MAKE) -C doc man

.PHONY: all translations doc

$(LOCALEDIR)/%/LC_MESSAGES/$(PROGNAME).mo: po/%.po
	mkdir -p $(shell dirname "$@")
	$(MSGFMT) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(LOCALEDIR)
	$(MAKE) -C doc clean-man

install-translations: translations
	for mo in $(TRANSLATIONS); do \
		install -Dm 0644 $$mo "$(DESTDIR)/$$mo" ;\
	done

install: install-translations
	$(MAKE) -C doc install-gzipped-man
	install -Dm 0755 bin/$(PROGNAME) "$(DESTDIR)/bin/$(PROGNAME)"
	sed -i 's:^TEXTDOMAINDIR=.*$$:TEXTDOMAINDIR="$(PREFIX)/$(LOCALEDIR)":' "$(DESTDIR)/bin/$(PROGNAME)"
	install -Dm 0644 share/$(PROGNAME)/helper-inc.sh  "$(DESTDIR)/share/$(PROGNAME)/helper-inc.sh"

.PHONY: install-translations install

