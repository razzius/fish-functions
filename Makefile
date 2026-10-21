SHELL := fish

.PHONY: test

test:
	@fish run_tests.fish < /dev/null
