.PHONY: test

test:
	@for test in test/*.fish ; do \
		fish $$test ; \
	done
