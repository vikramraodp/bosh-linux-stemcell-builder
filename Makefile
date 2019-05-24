.PHONY: stemcell
stemcell:
	make/stemcell

.PHONY: deps
deps:
	make/deps

.PHONY: build
build:
	make/build

.PHONY: fissile-stemcell
fissile-stemcell:
	make/fissile-stemcell

.PHONY: all
all: stemcell fissile-stemcell
