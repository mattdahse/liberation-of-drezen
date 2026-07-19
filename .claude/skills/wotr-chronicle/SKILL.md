---
name: wotr-chronicle
description: Compile Matt's Pathfinder: Wrath of the Righteous session transcripts into the campaign chronicle and publish the searchable archive. Use whenever Matt pastes a WotR/Pathfinder session transcript, asks for a session/chapter recap or chronicle update, or refers to the campaign or its characters (Harlock, Varic, Lupenor, Rabiah, Chirrik). Triggers: "transcript", "recap", "session summary", "chronicle update", "Chapter X", "Wrath of the Righteous", "WotR", or any pasted multi-paragraph game-session log set in Kenabres, Drezen, the Worldwound, or the Marchlands. Trigger even if the skill is not named — a pasted session log is enough.
---

# WotR Chronicle → Repo & Site

The campaign's **source of truth is the git repository** at `C:\Users\alast\drezen-archive`
(public GitHub Pages site: https://mattdahse.github.io/liberation-of-drezen/). Google Drive is a
retired backup, not authoritative. A session produces one new chapter appended to the source
markdown, after which the site is rebuilt and pushed.

## Inputs

- A session transcript pasted into the chat (Discord/Foundry/notes), **or** just "do the recap"
  (figure out the next chapter from the chronicle), sometimes with a chapter number/direction.
- The session's **Fathom recording id** — ask Matt, or find it via the Fathom tools
  (`list_meetings` / `search_meetings` for "Pathfinder", newest first) and confirm the date.

## Workflow

### 1. Load the bible and the current tail (always)

Read from the repo before drafting:
- `bible/00-style-and-prompt-guide.md` — voice, tone, roster, markdown conventions. Source of truth for voice; read every time.
- `bible/02-dramatis-personae.md` — names/spellings/continuity for any characters involved.
- `bible/03-lore-and-locations.md` — when named artifacts (Radiance, Solomar, Terendelev's scales, Sword of Valor) or established places appear.
- The **end** of `source/book-2-the-liberation-of-drezen.md` — read the last chapter to match the current voice and decide continuity. Note its highest chapter number and its "Index of Chapters".

### 2. Determine chapter scope

- **New chapter** — the prior chapter closed and this transcript starts a new beat: use the next Roman numeral (Book II is currently at XIX; the next is XX).
- **Continuation** — the prior chapter ended mid-arc/cliffhanger: rewrite its ending to flow into the new material rather than appending awkwardly.
- **Ambiguous** — ask Matt. Do not guess chapter boundaries.

### 3. Extract beats from the transcript

Combat turning points, mythic ability uses, crits, deaths/resurrections; roleplay decisions, vows, faction moves; discoveries (NPCs, items, lore); mythic trials and level-ups (as story beats, not mechanics). **In-game names only** in prose.

### 4. Draft the chapter (house style)

Match the existing chapters exactly:
```
## **Chapter XX — <Title>**

*<Month Day, Year> session — <in-game setting/date>*

<!-- fathom: <recording-id> -->

### **<Subsection>**
<prose with **bold names** and ***italic spells/relics***>
…
*— Session of <Month Day, Year> —*
```
Translate all mechanics into narrative. No OOC, dice, or rules talk.

### 5. Write back to the repo

1. **Append** the new chapter to the end of `source/book-2-the-liberation-of-drezen.md`.
2. Add its line to that file's **"The Index of Chapters"** near the top.
3. Rebuild the search index:
   `powershell -ExecutionPolicy Bypass -File C:\Users\alast\drezen-archive\build.ps1`
4. Commit and push (this is an outward-facing publish — proceed since it's the skill's purpose, but tell Matt it's going live):
   ```
   git -C C:\Users\alast\drezen-archive commit -am "Add Chapter XX — <title>"
   git -C C:\Users\alast\drezen-archive push
   ```
   GitHub Pages redeploys in ~1 minute.

**Encoding note (Windows PowerShell):** always read/write files with `[IO.File]::ReadAllText/WriteAllText`
(UTF-8), never `Get-Content -Raw` — PS 5.1 reads as ANSI and mangles em-dashes into mojibake.

### 6. Flag bible updates — do not silently overwrite

If new NPCs/items/locations appeared, output a **"Suggested bible updates"** list for
`bible/02-dramatis-personae.md` and `bible/03-lore-and-locations.md`. Apply them to the bible files
only if Matt asks; he curates those.

### 7. Present results

- One-paragraph summary: chapter number, session(s) covered, and that it's live (link the site).
- The "Suggested bible updates" list.
- Any open questions (uncertain rules calls, unclear intentions, name spellings worth confirming).

## Conventions & edge cases

- **Radiance** — Harlock's intelligent sword of Iomedae is effectively an NPC; its warmth/cooling/silence maps to his inner state.
- **Character death** — give it weight; a later resurrection is its own beat, not a hand-wave.
- **Mythic trials / level-ups** — frame as story turning points, not mechanical milestones.
- **Continuation across two sessions** — if a fight ran into a second session, combine into one chapter with two comma-separated fathom ids (`<!-- fathom: id1,id2 -->`).
- **Player-perspective "vision" pieces** (Aldwin Brightblade, Silas Thorne, Tam, etc.) are separate one-off narratives; this skill does not produce them.
- **Book I** (`source/book-1-the-road-to-drezen.md`) is complete; new sessions go in Book II.

## Optional Google Drive mirror

Drive is no longer authoritative. If Matt wants a Drive copy of a chapter, create it with the Drive
`create_file` tool (`contentMimeType: text/markdown`), but the repo remains the source of truth.
