ifeq ($(prefix),)
	prefix=/usr/local
endif
ifeq ($(datadir),)
	datadir=$(prefix)/share
endif
ifeq ($(shell which $(PC)),)
	PC=fpc
endif
ifeq ($(PFLAGS),)
	PFLAGS=-XX -Xg -Xs
endif
all:
	$(PC) $(PFLAGS) setgoodxfontz.pas
install:
	install -D -m755 setgoodxfontz $(DESTDIR)$(prefix)/bin/setgoodxfontz
clean:
	rm setgoodxfontz setgoodxfontz.dbg setgoodxfontz.o
