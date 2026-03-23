# wavekat-brand

Brand assets, design system, and social preview banners for WaveKat repositories.

## Assets

### Banners (1280 x 640)

GitHub social preview images.

| Repo | Preview |
|------|---------|
| wavekat-vad | [`assets/banners/wavekat-vad.svg`](assets/banners/wavekat-vad.svg) |
| wavekat-voice | [`assets/banners/wavekat-voice.svg`](assets/banners/wavekat-voice.svg) |

### Logos (640 x 160)

Repo logos in dark and light variants.

| Repo | Light | Dark |
|------|-------|------|
| wavekat-vad | [`assets/logos/wavekat-vad-light.svg`](assets/logos/wavekat-vad-light.svg) | [`assets/logos/wavekat-vad-dark.svg`](assets/logos/wavekat-vad-dark.svg) |

### Icons (256 x 256)

Standalone W mark for favicons, app icons, etc.

| Variant | File |
|---------|------|
| Light | [`assets/logos/wavekat-icon-light.svg`](assets/logos/wavekat-icon-light.svg) |
| Dark | [`assets/logos/wavekat-icon-dark.svg`](assets/logos/wavekat-icon-dark.svg) |

### Templates

| File | Purpose |
|------|---------|
| [`assets/template.svg`](assets/template.svg) | Banner template with placeholders |
| [`assets/logo-template.svg`](assets/logo-template.svg) | Logo template with placeholders |
| [`assets/icon-template.svg`](assets/icon-template.svg) | Icon template with placeholders |
| [`assets/w.svg`](assets/w.svg) | W letterform path |

## Generate PNGs

```sh
make png    # convert all SVGs to PNG
make clean  # remove generated PNGs
```

Requires `rsvg-convert` (`brew install librsvg`).
