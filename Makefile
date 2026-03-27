INKSCAPE := /Applications/Inkscape.app/Contents/MacOS/inkscape
ACTIONS  := select-all;object-to-path;export-plain-svg;export-do

.PHONY: dist png clean

# Convert text to paths: src/ → assets/ (requires Inkscape)
dist:
	@echo "Converting banners (text → paths)..."
	@mkdir -p assets/banners
	@for f in src/banners/*.svg; do \
		name=$$(basename "$$f"); \
		$(INKSCAPE) "$$f" --actions="select-all;object-to-path;export-filename:assets/banners/$$name;$(ACTIONS)" 2>/dev/null; \
		echo "  assets/banners/$$name"; \
	done
	@echo "Converting logos (text → paths)..."
	@mkdir -p assets/logos
	@for f in src/logos/*.svg; do \
		name=$$(basename "$$f"); \
		$(INKSCAPE) "$$f" --actions="select-all;object-to-path;export-filename:assets/logos/$$name;$(ACTIONS)" 2>/dev/null; \
		echo "  assets/logos/$$name"; \
	done
	@echo "Copying non-text assets..."
	@cp src/w.svg assets/w.svg
	@cp src/template.svg assets/template.svg
	@cp src/narrow-template.svg assets/narrow-template.svg
	@cp src/logo-template.svg assets/logo-template.svg
	@cp src/icon-template.svg assets/icon-template.svg
	@cp src/wordmark-template.svg assets/wordmark-template.svg
	@echo "Done."

# Convert all built SVGs to PNG
png:
	@echo "Converting banners..."
	@mkdir -p assets/banners/png
	@for f in assets/banners/*.svg; do \
		name=$$(basename "$$f" .svg); \
		rsvg-convert "$$f" -o "assets/banners/png/$$name.png"; \
		echo "  $$name.png"; \
	done
	@echo "Converting logos..."
	@mkdir -p assets/logos/png
	@for f in assets/logos/*.svg; do \
		name=$$(basename "$$f" .svg); \
		rsvg-convert "$$f" -o "assets/logos/png/$$name.png"; \
		echo "  $$name.png"; \
	done
	@echo "Done."

clean:
	rm -rf assets/banners assets/logos assets/w.svg assets/banners/png assets/logos/png
