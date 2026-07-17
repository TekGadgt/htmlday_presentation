# HTML Day Freewrite Deck — Design

**Date:** 2026-07-17
**Project:** Slidev slide deck for the Hampton Roads HTML Day Freewrite (Saturday, August 8, 2026, 10:00 AM to 2:00 PM, ECPI Main Campus, Virginia Beach).

## Purpose

A short, warm deck used at the start of the event (welcome, crash course) and then parked on a resting slide during the writing hour. The core message: HTML is writing. A text file and a browser are all anyone needs. Every resource beyond that is optional.

## Constraints

- Built with Slidev, following the setup pattern in `~/projects/pantry_party_presentation` (single `slides.md`, `@slidev/cli`, `qrcode.vue` for QR codes).
- Themed after the event announcement page at `~/projects/htmlday-hamptonroads/2026/index.html`: darkcyan page background, `#f9f9f9` content boxes with `1px solid #ddd` borders, default browser serif type, raw hand-written-HTML energy.
- Whimsy is toggle-able and original. Do not reuse the announcement page's exact gifs, marquee copy, or audio. No sound at all (presenter safety).
- The event has a no-AI policy; the deck states it plainly and keeps the tone friendly.
- Light on em dashes in slide copy.

## Approach

Use Slidev's built-in default theme plus a project stylesheet that recreates the announcement page look. No third-party theme (it would leak its own polish through) and no custom theme package (overkill for one deck).

### Project structure

```
package.json          # @slidev/cli, qrcode.vue; scripts: dev, build, export
slides.md             # the whole deck
style.css             # raw-HTML aesthetic overrides
global-top.vue        # whimsy toggle button + whimsy layer
composables/whimsy.ts # shared reactive whimsy state (persists across slides)
public/photos/        # host photos
```

Host photos:
- Ryan: `IMG_3831.jpg` (copied from pantry party)
- Austin: `ag-webdev-cropped.jpeg` (copied from pantry party)
- Chazona: placeholder image with a TODO until she provides one

### Whimsy toggle

A fixed corner button rendered by `global-top.vue`, styled like the page's beveled Win95-style toggle (raised border, pressed state). Off by default. When on:

- Tiled background pattern (CSS-generated, not the page's png)
- A marquee-style crawl along the top edge with original event tagline copy
- A few floating emoji accents, kept away from slide content

State lives in a small composable so the toggle persists across slide navigation.

### Slide flow (14 slides)

1. **Title.** Hampton Roads HTML Day! Freewrite, Aug 8, 10 to 2, ECPI.
2. **Your hosts.** Austin Galyon, Chazona Baum, Ryan McGovern, with photos.
3. **What is this?** HTML is writing. Type words, save the file as `.html`, open it in a browser. You made a website.
4. **How today works.** Hello, optional crash course, about an hour of freewriting, optional sharing.
5. **Thank you.** ECPI for the space; val.town for coffee, pastries, and the starter template. Placed early so everyone hears it.
6. **AI policy.** AI-free event. Hands on keys, write it yourself like it's 2003.
7. **All you need.** A text file and a browser. TextEdit or Notepad, save as `.html`, double-click. Everything after this slide is optional.
8. **HTML in one slide.** Skeleton: `<html>`, `<head>`, `<body>`, headings, paragraphs.
9. **HTML in one more slide.** Links, images, lists.
10. **Fun tags.** `<details>`/`<summary>`, `<blockquote>`, `<mark>`, `<kbd>`, `<hr>`. (No `<marquee>`; it still works but it's deprecated, and the modern way is the better habit.)
11. **A dab of CSS.** Inline `style=""` for color, background, font size. A peek at a `<style>` block.
12. **Freewrite prompts.** From the html.energy guide: a calming page, a letter to a memory, your favorite sandwich, a page using a tag you've never used.
13. **Resources, all optional.** QR codes in padded white boxes (contrast against darkcyan):
    - val.town basic-html-starter: https://www.val.town/x/templates/basic-html-starter
    - Neocities (put it online): https://neocities.org
    - freeCodeCamp (keep learning): https://www.freecodecamp.org
    - html.energy (the movement): https://html.energy
14. **Resting slide.** Parked during the writing hour. Hosts' names and photos ("flag us down"), resource QRs repeated small, sponsor names.

### QR codes

`qrcode.vue` components inside white padded boxes, same pattern as the pantry party deck (`level="H"`, white background for scannability).

## Error handling / risks

- Chazona's photo is a placeholder; swap when received.
- QR codes must be tested from a phone at presentation size before the event.
- Whimsy layer must never obscure slide content; accents are positioned at edges.

## Testing

- `npm run dev` renders all 14 slides without errors.
- Whimsy toggle flips on and off from any slide and persists across navigation.
- QR codes scan from a phone against the projected/rendered slide.
- `npm run build` produces a working static build.
