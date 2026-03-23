.PHONY: png clean

# Convert all SVG files to PNG
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
	rm -rf assets/banners/png assets/logos/png
