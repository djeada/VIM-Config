SHELL := /bin/bash
.PHONY: install uninstall plug-update fmt

install:
	@./scripts/setup.sh

uninstall:
	@./scripts/uninstall.sh

plug-update:
	@if command -v nvim >/dev/null 2>&1; then nvim +'silent! PlugUpdate --sync' +qall; \
	elif command -v vim >/dev/null 2>&1; then vim +'silent! PlugUpdate --sync' +qall; \
	else echo "vim/nvim not found"; fi

fmt:
	@echo "Nothing to format in this repo."
