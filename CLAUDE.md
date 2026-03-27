# wavekat-brand

Brand assets repo for the WaveKat organization. Contains SVG banners, logos, icons, wordmarks, and templates used across all wavekat-* repositories.

## Repo structure

- `assets/banners/` — Social preview banners (1280x640) and narrow README header banners (1280x320)
- `assets/logos/` — Repo logos (640x160) in light/dark variants, plus icons (256x256) and wordmarks (288x72)
- `assets/` — SVG templates and the shared W letterform path (`w.svg`)

## Color scheme per repo

Each repo has a unique accent color used throughout its assets:

| Repo | Accent | Text fill | Description color |
|------|--------|-----------|-------------------|
| wavekat-vad | `#00bcd4` (cyan) | `#e0f7fa` | `#5f8f8a` |
| wavekat-turn | `#7c4dff` (purple) | `#ede7f6` | `#7a6b9f` |
| wavekat-voice | `#ff6d00` (orange) | `#fff3e0` | `#9f7a56` |
| wavekat-core | `#00e676` (green) | `#e8f5e9` | `#6b9f6b` |

## Creating new assets

1. Copy the appropriate template from `assets/` (e.g., `narrow-template.svg` for README headers)
2. Replace the accent color, repo name, description text, and signature ribbon position
3. The ribbon x-coordinates shift based on the text width of the repo name — match a same-length existing banner
4. Add the new asset to `README.md`

## Generating PNGs

```sh
make png    # convert all SVGs to PNG (requires rsvg-convert via `brew install librsvg`)
make clean  # remove generated PNGs
```
