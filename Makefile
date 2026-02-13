SHELL := fish

.PHONY: test

test:
	@each fish test/*.fish
