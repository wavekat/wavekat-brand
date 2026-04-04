# wavekat-brand

Brand assets repo for the WaveKat organization. Contains SVG banners, logos, icons, wordmarks, and templates used across all wavekat-* repositories.

## Repo structure

- `src/banners/` — Source SVG banners with `<text>` elements (1280x640 and 1280x320)
- `src/logos/` — Source SVG logos with `<text>` elements (640x160, 256x256, 288x72)
- `src/` — SVG templates and the shared W letterform path (`w.svg`)
- `assets/banners/` — Built SVGs with text converted to paths (what downstream repos reference)
- `assets/logos/` — Built SVGs with text converted to paths

## SVG workflow: src vs assets

SVGs in `src/` are **source files** — they use `<text>` elements with system fonts (Menlo) for easy editing. These won't render correctly when proxied by GitHub/camo/img.gs because those servers lack the fonts.

SVGs in `assets/` are **built files** — Inkscape converts all text to `<path>` elements so they render correctly everywhere. Downstream repos reference `assets/` SVGs.

**IMPORTANT for Claude Code**: Always generate and edit SVGs in `src/` using `<text>` elements. Never generate `<path>` data for text content — the user will run `make dist` to convert text to paths via Inkscape. The font used is Menlo (macOS system monospace).

## Color scheme per repo

Each repo has a unique accent color used throughout its assets:

| Repo | Accent | Text fill | Description color |
|------|--------|-----------|-------------------|
| wavekat-vad | `#00bcd4` (cyan) | `#e0f7fa` | `#5f8f8a` |
| wavekat-turn | `#7c4dff` (purple) | `#ede7f6` | `#7a6b9f` |
| wavekat-voice | `#ff6d00` (orange) | `#fff3e0` | `#9f7a56` |
| wavekat-core | `#00e676` (green) | `#e8f5e9` | `#6b9f6b` |
| wavekat-lab | `#ffd740` (amber) | `#fff8e1` | `#9f8a40` |
| wavekat-tts | `#ff4081` (pink) | `#fce4ec` | `#9f6b7a` |

## Creating new assets

1. Copy the appropriate template from `src/` (e.g., `src/narrow-template.svg` for README headers)
2. Replace the accent color, repo name, description text, and signature ribbon position
3. The ribbon x-coordinates shift based on the text width of the repo name — match a same-length existing banner
4. Add the new asset to `README.md`
5. Run `make dist` to generate the path-converted version in `assets/`

## Build commands

```sh
make dist   # convert text to paths: src/ → assets/ (requires Inkscape)
make clean  # remove built assets
```

### Prerequisites

- **Inkscape** — `brew install --cask inkscape`
