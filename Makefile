# OH, HAI! :)

PREFIX    ?= /usr/local
BINDIR    ?= $(DESTDIR)$(PREFIX)/bin/
MANDIR    ?= $(DESTDIR)$(PREFIX)/share/man/man1/

SOURCES   := $(wildcard src/*)
SCDOCS    := $(wildcard doc/*.1.md)
MANPAGES  := $(SCDOCS:.1.md=.1)
ZMANPAGES := $(MANPAGES:.1=.1.gz)

GZIP       = gzip
SCDOC      = scdoc
INSTALL    = install

ENV       ?= $(shell sh -c 'command -v env  || echo "/usr/bin/env"')

.PHONY: all
all: $(SOURCES) $(MANPAGES)

install: $(SOURCES) $(ZMANPAGES)
	@test -d $(BINDIR) || mkdir -p $(BINDIR)
	$(INSTALL) -m 0755 $(SOURCES) $(BINDIR)
	@test -d $(MANDIR) || mkdir -p $(MANDIR)
	$(INSTALL) -m 0644 $(ZMANPAGES) $(MANDIR)

doc/%.1: doc/%.1.md
	@$(SCDOC) <$< >$@

doc/%.1.gz: doc/%.1
	@$(GZIP) -c $< >$@

patch-env: $(SOURCES)
	@sed "s|#!/usr/bin/env|#!$(ENV)|g" -i $<

.PHONY: mostlyclean distclean clean
mostlyclean:
	@rm -vf *~ src/*~ doc/*~
clean: mostlyclean
	@rm -vf $(ZMANPAGES)
distclean: clean
	@rm -vf $(MANPAGES)

# eof
