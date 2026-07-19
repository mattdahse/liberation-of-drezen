# The Liberation of Drezen — Campaign Archive

The **source of truth** for our Pathfinder: *Wrath of the Righteous* campaign —
*A Chronicle of the Crusade Against the Worldwound* — and the searchable site built from it.

**Live site:** https://mattdahse.github.io/liberation-of-drezen/

## Repository layout

```
source/                         ← the canonical chronicle (edit these)
  book-1-the-road-to-drezen.md      Book I  (14 chapters): Kenabres → the gates of Drezen
  book-2-the-liberation-of-drezen.md Book II (19 chapters): the siege and the crusade beyond
bible/                          ← authoring reference (voice, cast, lore)
  00-style-and-prompt-guide.md
  02-dramatis-personae.md
  03-lore-and-locations.md
build.ps1                       ← compiles source/*.md → data.js
index.html                      ← the reader app (search, chapters, cast)
data.js                         ← BUILD OUTPUT — do not hand-edit
.nojekyll
```

Each chapter in `source/` carries its session recording inline as
`<!-- fathom: <recording-id> -->` (the build turns it into the "▶ recording" link).

## Adding a session

1. Draft the new chapter into the right `source/book-*.md` file, following `bible/00-style-and-prompt-guide.md`. Include the `<!-- fathom: … -->` line under the subtitle.
2. Rebuild the search index:
   ```powershell
   powershell -ExecutionPolicy Bypass -File build.ps1
   ```
3. Commit and push — GitHub Pages redeploys automatically (~1 minute):
   ```powershell
   git commit -am "Add Chapter XX — <title>"
   git push
   ```

The `wotr-chronicle` skill automates steps 1–3 from a raw session transcript.

## Running locally

Put `index.html` and `data.js` in a folder and open `index.html` in any browser — it runs entirely client-side (works from `file://`). No server or dependencies.

*Compiled from session transcripts (Fathom) and the emailed chapter recaps.*
