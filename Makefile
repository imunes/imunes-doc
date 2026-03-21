# variables
SRC != find docs -name '*.md' ! -name 'index.md' ! -name 'A*.md' | sort
APP != find docs -name 'A*.md' | sort
SRC := docs/index.md $(SRC) $(APP)
OUT := build/IMUNES_manual
PANDOC := pandoc
METAFILE := ./assets/pandoc_variables.yaml

ASSETS_SRC := ./assets
ASSETS_DST := build/assets
CSS := ./assets/styles.css

# default target
all: pdf html

# ensure build directory exists
build:
	mkdir -p build

assets: build
	rsync -a $(ASSETS_SRC)/ $(ASSETS_DST)/

# PDF (with TOC + xelatex)
pdf: build
	$(PANDOC) $(SRC) \
		--filter pandoc-crossref \
		-s \
		--wrap auto \
		--metadata-file=$(METAFILE) \
		-f markdown \
		--toc \
		--toc-depth=4 \
		--pdf-engine=xelatex \
		--number-sections \
		-o $(OUT).pdf

# HTML (with TOC + CSS)
html: assets
	$(PANDOC) $(SRC) \
		--filter pandoc-crossref \
		-s \
		--wrap auto \
		--metadata-file=$(METAFILE) \
		-f markdown \
		--toc \
		--toc-depth=4 \
		--number-sections \
		-c $(CSS) \
		-o $(OUT).html

# clean
clean:
	rm -rf build/*
