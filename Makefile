.PHONY: os-image
os-image:
	make/os-image

.PHONY: deps
deps:
	make/deps

.PHONY: build
build:
	make/build

.PHONY: clean
clean:
	rm -rf build/

.PHONY: fissile-stemcell
fissile-stemcell:
	make/fissile-stemcell

.PHONY: all
all: os-image fissile-stemcell
