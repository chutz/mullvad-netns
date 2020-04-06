# 
NAME = mullvad-netns

PREFIX ?= usr
BINDIR ?= usr/bin
SYSCONFDIR ?= etc
LOCALSTATEDIR ?= var/lib
INSTALL = install

.PHONY: all install

all:

install: $(NAME).bash rules.nft
	$(INSTALL) -D mullvad-netns.bash $(DESTDIR)/$(BINDIR)/$(NAME)
	$(INSTALL) -m 0644 -D rules.nft $(DESTDIR)/$(SYSCONFDIR)/$(NAME)/rules.nft
	$(INSTALL) -m 0644 $(NAME).config $(DESTDIR)/$(SYSCONFDIR)/$(NAME)/config
	$(INSTALL) -m 0600 account $(DESTDIR)/$(SYSCONFDIR)/$(NAME)/account
	$(INSTALL) -d $(DESTDIR)/$(LOCALSTATEDIR)/$(NAME)
