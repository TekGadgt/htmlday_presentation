# HTML Day Freewrite Handout — Design

**Date:** 2026-07-17
**Project:** A one-page printed cheat sheet for freewrite attendees, built with Typst, living alongside the Slidev deck in this repo.

## Purpose

A paper companion to the deck's crash-course slides: the HTML/CSS examples and the resource URLs, printable cheaply, readable at a desk while someone writes. No QR codes; URLs appear as plain text.

## Constraints

- Single Typst file `handout.typ` at the project root. No template split, no generation from `slides.md`; the mild content duplication with the deck is accepted.
- One US Letter page, one side, two columns, roughly 0.5in margins, body around 9.5pt.
- Typography matches the deck: Times New Roman body, monospace code in thin `#ddd`-bordered boxes on `#f9f9f9`, darkcyan headings (must degrade cleanly to grayscale).
- Copy is light on em dashes.
- Compiled with Typst 0.15 (installed at `/opt/homebrew/bin/typst`).
- npm script `handout`: `typst compile handout.typ`. Output `handout.pdf` is gitignored.

## Content (in order)

1. **Header.** "Hampton Roads HTML Day" title, "Freewrite Cheat Sheet · Saturday, August 8, 2026" subtitle.
2. **All you need.** The 4 steps: open any text editor, write some words, save as `mypage.html`, double-click it. The TextEdit tip (Format menu, Make Plain Text, first). The line that everything below is optional.
3. **HTML in one page.** The skeleton example from the deck: doctype, `html`, `head`/`title`, `body` with `h1` and `p`, plus the "browser forgives whatever you skip" note.
4. **Links, images, lists.** `a`, `img` with alt, `ul`/`li`, `ol`.
5. **Fun tags.** `details`/`summary`, `mark`, `kbd`, `blockquote`, `hr`. No `marquee`.
6. **A dab of CSS.** Inline `style=""` example and the `<style>`-block example from the deck.
7. **Resources, all optional.** Plain-text URLs, one description line each:
   - val.town starter, a template to riff on: https://www.val.town/x/templates/basic-html-starter
   - Neocities, put it online free: https://neocities.org
   - freeCodeCamp, keep learning free: https://www.freecodecamp.org
   - html.energy, the movement: https://html.energy
8. **Footer.** Space by ECPI · Coffee, pastries, and starter template by val.town.

## Testing

- `npm run handout` (and bare `typst compile handout.typ`) exits 0.
- Render the PDF to PNG and visually confirm: exactly one page, two balanced columns, no clipped or overflowing content, code boxes and headings render as designed.
