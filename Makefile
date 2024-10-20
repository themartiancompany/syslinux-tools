#
# SPDX-License-Identifier: GPL-3.0-or-later

_PROJECT=syslinux-tools
PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
LIB_DIR=$(DESTDIR)$(PREFIX)/lib

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 $(_PROJECT)/mksyslinux "$(BIN_DIR)/mksyslinux"

install-configs:

	install -vDm 644 configs/syslinux.cfg "$(LIB_DIR)/$(_PROJECT)/configs/syslinux.cfg"
	install -vDm 644 configs/syslinux.cfg "$(LIB_DIR)/$(_PROJECT)/configs/syslinux.cfg"


install-doc:
	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
