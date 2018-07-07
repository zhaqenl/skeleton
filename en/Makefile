.PHONY: all clean

FILES=$(filter-out src/footer.md src/index.md, $(wildcard src/*.md))
BUILDER=emem

OG_TITLE="$$(head -1 $<)"
OG_TYPE="article"
OG_IMAGE="https://username.github.io/thumbnail.png"
ANALYTICS="12345678-9"

all:
	parallel --will-cite "$(MAKE) {/.}.html" ::: $(FILES)
	$(BUILDER) \
          -D "A website about foo, bar, and baz." \
          -K "Some random person" \
          --og-title "Foo, Bar, and Baz." \
          --og-type $(OG_TYPE) \
          --og-url "https://username.github.io/en/" \
          --og-image $(OG_IMAGE) \
          --analytics $(ANALYTICS) \
          --lang "en" \
          -RFiamuo index.html \
          src/index.md src/footer.md

%.html: src/%.md
	if [[ ! -d "$$(basename $< .md)" ]]; then mkdir "$$(basename $< .md)"; fi
	$(BUILDER) \
          -D $(OG_TITLE) \
          -K "$$(cat $<.dat)" \
          --og-title $(OG_TITLE) \
          --og-type $(OG_TYPE) \
          --og-url "https://ebzzry.io/en/$$(basename $< .md)/" \
          --og-image $(OG_IMAGE) \
          --analytics $(ANALYTICS) \
          --lang "en" \
          -RFiamuo "$$(basename $< .md)/index.html" \
          $< src/footer.md

clean:
	rm -vf *.html
	find . -maxdepth 1 -type d ! -path . ! -iname src -exec rm -rf {} \;
