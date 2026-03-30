INKSCAPE := /Applications/Inkscape.app/Contents/MacOS/inkscape
ACTIONS  := select-all;object-to-path;export-plain-svg;export-do

.PHONY: dist png clean help

.DEFAULT_GOAL := help

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
	@echo "Converting og image (text → paths)..."
	@$(INKSCAPE) src/og.svg --actions="select-all;object-to-path;export-filename:assets/og.svg;$(ACTIONS)" 2>/dev/null
	@echo "  assets/og.svg"
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
	@echo "Converting og image..."
	@if [ -f assets/og.svg ]; then rsvg-convert assets/og.svg -o assets/og.png && echo "  og.png"; else echo "  skipping og.png (run make dist first)"; fi
	@echo "Done."

clean:
	rm -rf assets/banners assets/logos assets/og.svg assets/og.png assets/w.svg assets/banners/png assets/logos/png

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  dist    Convert src/ SVGs (text elements) to assets/ SVGs (paths) via Inkscape"
	@echo "  png     Convert assets/ SVGs to PNG using rsvg-convert"
	@echo "  clean   Remove all built assets (assets/banners, assets/logos)"
	@echo "  help    Show this help message"
	@echo ""
	@echo "Prerequisites:"
	@echo "  dist: brew install --cask inkscape"
	@echo "  png:  brew install librsvg"
