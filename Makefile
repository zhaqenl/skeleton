.PHONY: all clean rebuild

FILES=$(wildcard src/*.md)
BUILDER=emem

OG_TITLE="$$(head -1 $<)"
OG_TYPE="article"
OG_IMAGE="https://username.github.io/thumbnail.png"
ANALYTICS="12345678-9"

%.html: src/%.md
	$(BUILDER) \
          --og-title $(OG_TITLE) --og-type $(OG_TYPE) \
          -D $(OG_TITLE) \
          -K "Some random person" \
          --og-url "https://username.github.io/$$(basename $< .md).html" \
          --og-image $(OG_IMAGE) \
          --analytics $(ANALYTICS) \
          -RFiamuo "$$(basename $< .md).html" \
          $<

all:
	$(BUILDER) -r
	$(MAKE) $(MFLAGS) -C en
	parallel --will-cite "$(MAKE) {/.}.html" ::: $(FILES)

clean:
	find . -maxdepth 1 -name '*.html' ! -name 'sitemap.html' ! -name 'index.html' -exec rm -vf {} \;
	rm -rvf static
	$(MAKE) -C en $@

rebuild:
	$(MAKE) clean
	$(MAKE)
