# variables
SRC != find docs -name '*.md' ! -name 'index.md' ! -name 'A*.md' | sort
APP != find docs -name 'A*.md' | sort
SRC := docs/index.md $(SRC) $(APP)
GEN != find generated-docs -name '*.md'
TMP_SRC := build/tmp.md
OUT := build/IMUNES_manual
PANDOC := pandoc
METAFILE := ./assets/pandoc_variables.yaml

ASSETS_SRC := ./assets
ASSETS_DST := build/assets
CSS := ./assets/styles.css

.PHONY: all clean pdf html assets build

# default target
all: html pdf

$(TMP_SRC): $(SRC) $(APP) $(GEN)
	mkdir -p build
	: > $(TMP_SRC)

	for f in $(SRC); do \
		perl -pe 's!\{\{include:([^}]+)\}\}!do { local $$/; open my $$fh, "<", $$1 or die "Cannot open $$1"; <$$fh> }!ge' $$f >> $(TMP_SRC); \
		echo "" >> $(TMP_SRC); \
	done

# ensure build directory exists
build:
	mkdir -p build

assets: build
	rsync -a $(ASSETS_SRC)/ $(ASSETS_DST)/

# PDF (with TOC + xelatex)
pdf: build $(TMP_SRC)
	$(PANDOC) $(TMP_SRC) \
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
html: assets $(TMP_SRC)
	$(PANDOC) $(TMP_SRC) \
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
