# Canonical Character Portraits

This directory is the **source of truth for how the people of the chronicle look.**
Every named character who has been given a face lives here as a single canonical
portrait. When any image is generated that depicts one of these characters — a
chapter illustration, a scene, a group shot — that character's canonical portrait
below **must** be supplied to the image tool as a likeness reference, so they stay
recognizable from picture to picture. All new art follows the house look described in
[`../bible/04-visual-style-guide.md`](../bible/04-visual-style-guide.md).

The portraits were gathered in different styles; that is fine for a reference of
*who a character is*. The style guide governs *how* new art is rendered. The
definitive style exemplar is the full-body Arueshalae in [`../images/arueshalae.png`](../images/arueshalae.png).

## Registry

| Character | Portrait | Cast group | Likeness anchors (keep these constant) |
|---|---|---|---|
| **Harlock Greyforge** | [`harlock.png`](harlock.png) | The Company | Half-orc man; green skin, short black hair, dark brows, clean-shaven, subtly pointed ears. **A clean, strong, human-like jaw with a closed mouth — NO tusks, NO underbite, no protruding lower teeth.** Noble, even features. Ornate golden full plate; bears the sunburst shield *Radiance*, its face a blazing star. |
| **Lupenor Celest** | [`lupenor.png`](lupenor.png) | The Company | Elf woman; long fiery copper-orange hair, violet eyes, freckles; blue teardrop earrings; dark-green collar; arrows quivered at her back. |
| **Rabiah** | [`rabiah.png`](rabiah.png) | The Company | Human woman; wild curly red hair tangled with green leaves, green eyes, freckles; green hooded cloak; Riftwardens' spiral at the shoulder. |
| **Varic Sarian** | [`varic.png`](varic.png) | The Company | Half-elf man; long straight blond hair, thin gold circlet; red scarf/mantle over a gold-filigreed breastplate with one steel pauldron; Sarenrae's sunset behind him. |
| **Chirrik** | [`chirrik.png`](chirrik.png) | The Company | Mongrelman scout; reptilian beaked face, brown ponytail, scaled clawed legs; hooded travel leathers; longbow and quiver. |
| **Cornelia Dewfoot** | [`cornelia.png`](cornelia.png) | Rabiah's Redeemers | Small fey-featured druid; blonde braided hair, pointed ears, young face; tattered green druid garb, animal-skull satchel; carries an oversized scythe; crescent moon overhead. |
| **Elara Dawnstrider** | [`elara-dawnstrider.png`](elara-dawnstrider.png) | Harlock's Order | Human paladin woman; long brown wavy hair; silver-and-gold spiked plate; ornate polearm; sunlit citadel. |
| **Arueshalae** | [`arueshalae.png`](arueshalae.png) | Allies & Powers | Succubus; short tousled black hair, curved dark horns, pointed ears, freckled; dark membranous wings. **Dressed in practical brown leather adventuring armor — a high-collared, buckled, long-sleeved leather jacket over leather trousers and tall buckled boots. FULLY COVERED, modest and battle-worn; never revealing, never a bikini/harness/bare midriff.** Tattoos show only at the open collar of her throat. Storm-lit. Style exemplar: [`../images/arueshalae.png`](../images/arueshalae.png). |
| **Rothin Vald** | [`rothin.png`](rothin.png) | Varic's Temple | Human priest of Sarenrae; dark hair going grey, full dark beard; blue tunic with gold trim. Varic's cohort; keeper of the Hidden Temple of Sarenrae west of Drezen. |

## Known drift — state the negatives explicitly in every prompt

Image models fall into the same traps repeatedly. Descriptions here are **prescriptive**: if an anchor is silent on something, the model invents it, and it invents these:

- **Fantasy-armor sexualization.** Any woman in "leather" trends toward a bikini, bare midriff, or strap harness. Arueshalae in particular is a succubus, which pulls hard in that direction — she is a *penitent*, dressed as a working scout in covered leathers. Always say **"fully covered, modest, practical armor"** and add `bare midriff, revealing outfit, bikini armor, cleavage` to the Avoid line.
- **Orc caricature.** "Half-orc" alone yields tusks, an underbite, and a brutish snout. Harlock has none of these. Say **"no tusks, no underbite, clean strong human-like jaw"** and put `tusks, underbite, protruding lower teeth, brutish features` in the Avoid line.
- **Verify against the portrait, not your memory of it.** Both errors above originated in this file — an anchor written from a hazy recollection propagated straight into the art. Re-open the PNG before you write or trust a row.

## Adding a character to the registry

1. Save the canonical portrait here as `<kebab-name>.png` (portrait/bust framing, ~3:4).
2. Add a row above with the likeness anchors — the handful of features that must never drift.
3. Register the likeness in the site: add `'<Cast Name>': 'characters/<file>.png'` to the
   `PORTRAITS` map in [`../index.html`](../index.html) so it appears on the Cast gallery.
4. Keep the filename stable forever — the site and the style guide both reference it by name.
