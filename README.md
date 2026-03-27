# wavekat-brand

Brand assets, design system, and social preview banners for WaveKat repositories.

## Assets

### Banners (1280 x 640)

GitHub social preview images.

| Repo | Preview |
|------|---------|
| wavekat-vad | ![wavekat-vad banner](assets/banners/wavekat-vad.svg) |
| wavekat-voice | ![wavekat-voice banner](assets/banners/wavekat-voice.svg) |
| wavekat-turn | ![wavekat-turn banner](assets/banners/wavekat-turn.svg) |
| wavekat-core | ![wavekat-core banner](assets/banners/wavekat-core.svg) |
| wavekat-lab | ![wavekat-lab banner](assets/banners/wavekat-lab.svg) |

### Narrow Banners (1280 x 320)

README header images.

| Repo | Preview |
|------|---------|
| wavekat-vad | ![wavekat-vad narrow banner](assets/banners/wavekat-vad-narrow.svg) |
| wavekat-voice | ![wavekat-voice narrow banner](assets/banners/wavekat-voice-narrow.svg) |
| wavekat-turn | ![wavekat-turn narrow banner](assets/banners/wavekat-turn-narrow.svg) |
| wavekat-core | ![wavekat-core narrow banner](assets/banners/wavekat-core-narrow.svg) |
| wavekat-lab | ![wavekat-lab narrow banner](assets/banners/wavekat-lab-narrow.svg) |

### Wordmark (288 x 72)

Main wavekat wordmark with signature ribbon.

| Variant | Preview |
|---------|---------|
| Light | ![wavekat light](assets/logos/wavekat-light.svg) |
| Dark | ![wavekat dark](assets/logos/wavekat-dark.svg) |

### Logos (640 x 160)

Repo logos in dark and light variants.

| Repo | Light | Dark |
|------|-------|------|
| wavekat-vad | ![wavekat-vad light](assets/logos/wavekat-vad-light.svg) | ![wavekat-vad dark](assets/logos/wavekat-vad-dark.svg) |
| wavekat-turn | ![wavekat-turn light](assets/logos/wavekat-turn-light.svg) | ![wavekat-turn dark](assets/logos/wavekat-turn-dark.svg) |

### Icons (256 x 256)

Standalone W mark for favicons, app icons, etc.

| Variant | Preview |
|---------|---------|
| Light | ![icon light](assets/logos/wavekat-icon-light.svg) |
| Dark | ![icon dark](assets/logos/wavekat-icon-dark.svg) |

### Templates

| File | Purpose |
|------|---------|
| [`assets/template.svg`](assets/template.svg) | Banner template with placeholders |
| [`assets/narrow-template.svg`](assets/narrow-template.svg) | Narrow banner template (4:1 ratio) |
| [`assets/logo-template.svg`](assets/logo-template.svg) | Logo template with placeholders |
| [`assets/icon-template.svg`](assets/icon-template.svg) | Icon template with placeholders |
| [`assets/wordmark-template.svg`](assets/wordmark-template.svg) | Wordmark template (4:1 ratio) |
| [`assets/w.svg`](assets/w.svg) | W letterform path |

## Generate PNGs

```sh
make png    # convert all SVGs to PNG
make clean  # remove generated PNGs
```

Requires `rsvg-convert` (`brew install librsvg`).
