COMPONENTS = software-lib-a software-lib-b software-lib-c software-app-a software-app-b software-app-c

.PHONY: build test lint doc release clean

build:
	@for c in $(COMPONENTS); do \
	   $(MAKE) -s -C $$c build; \
	 done

test:
	@for c in $(COMPONENTS); do \
	   $(MAKE) -s -C $$c tests; \
	 done

lint:
	@for c in $(COMPONENTS); do \
	   $(MAKE) -s -C $$c lint; \
	 done

doc:
	@mkdir docs
	@for c in $(COMPONENTS); do \
	   $(MAKE) -s -C $$c docs; \
	   cp -R $$c/docs docs/$$c; \
	 done

release:

	@for c in $(COMPONENTS); do \
	   $(MAKE) -s -C $$c release; \
	 done

clean:
	@find . -type d -name "target" -exec rm -rf {} +
	@find . -type d -name "docs" -exec rm -rf {} +
	@find . -type f -name "*~" -exec rm -rf {} \;


