# Typst Handout Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** A one-page, two-column printed cheat sheet (`handout.typ` → PDF) with the deck's HTML/CSS examples and plain-URL resources.

**Architecture:** One standalone Typst file at the project root; content duplicated from the deck by design. An npm script wraps `typst compile`. The PDF and preview PNGs are gitignored build artifacts.

**Tech Stack:** Typst 0.15 (`/opt/homebrew/bin/typst`), npm scripts.

## Global Constraints

- One US Letter page, one side, two columns, ~0.5in margins, body ~9.5pt.
- Times New Roman body; monospace code in thin `#ddd`-bordered boxes on `#f9f9f9`; darkcyan (`#008b8b`) headings.
- Copy light on em dashes. No `<marquee>`.
- Resource URLs verbatim: https://www.val.town/x/templates/basic-html-starter · https://neocities.org · https://www.freecodecamp.org · https://html.energy
- Footer line verbatim: "Space by ECPI · Coffee, pastries, and starter template by val.town"
- Working directory: /Users/tekgadgt/projects/htmlday_presentation (git branch `main`).

---

### Task 1: The handout

**Files:**
- Create: `handout.typ`
- Modify: `package.json` (add `handout` script)
- Modify: `.gitignore` (ignore `handout.pdf`, `handout-preview-*.png`)
- Modify: `README.md` (document the script)

**Interfaces:**
- Produces: `npm run handout` → `handout.pdf` at project root.

- [ ] **Step 1: Write `handout.typ`**

```typst
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 0.55in),
  columns: 2,
  footer: align(center, text(size: 8pt, fill: rgb("#666666"))[
    Space by ECPI · Coffee, pastries, and starter template by val.town
  ]),
)
#set columns(gutter: 22pt)
#set text(font: "Times New Roman", size: 9.5pt)
#set par(justify: false)
#set enum(tight: true)

#show heading.where(level: 2): it => {
  v(5pt, weak: true)
  text(fill: rgb("#008b8b"), size: 11.5pt, weight: "bold", it.body)
  v(4pt, weak: true)
}

#show raw.where(block: true): it => block(
  fill: rgb("#f9f9f9"),
  stroke: 0.5pt + rgb("#dddddd"),
  inset: 6pt,
  width: 100%,
  text(size: 8.5pt, it),
)

#show raw.where(block: false): it => box(
  fill: rgb("#f2f2f2"),
  stroke: 0.5pt + rgb("#dddddd"),
  inset: (x: 2pt),
  outset: (y: 2pt),
  it,
)

#place(
  top + center,
  scope: "parent",
  float: true,
  clearance: 16pt,
)[
  #text(size: 17pt, weight: "bold")[Hampton Roads HTML Day!]
  #v(3pt, weak: true)
  #text(size: 10pt, fill: rgb("#444444"))[Freewrite Cheat Sheet · Saturday, August 8, 2026]
]

== All you need

+ Open TextEdit, Notepad, or any text editor
+ Write some words
+ Save the file as `mypage.html`
+ Double-click it

That's a website. You're done. Everything below is _optional_.

#text(size: 8.5pt, fill: rgb("#555555"))[TextEdit users: Format menu, Make Plain Text, first.]

== HTML in one page

```html
<!DOCTYPE html>
<html>
  <head>
    <title>my page</title>
  </head>
  <body>
    <h1>A big heading</h1>
    <p>A paragraph of whatever you
    want to say.</p>
  </body>
</html>
```

Honestly, even this is optional. The browser forgives whatever you skip.

== Links, images, lists

```html
<a href="https://html.energy">a link</a>

<img src="cat.jpg" alt="my cat">

<ul>
  <li>a list</li>
  <li>of things</li>
</ul>

<ol>
  <li>or in order</li>
</ol>
```

Links are the web. One anchor tag and your page is connected to everything.

== Fun tags

```html
<details>
  <summary>Click me</summary>
  A hidden surprise.
</details>

<mark>highlighted like a marker</mark>

<kbd>Ctrl</kbd> + <kbd>S</kbd>

<blockquote>Something someone said.</blockquote>

<hr>
```

These all work with zero CSS. View source on any site to find more.

== A dab of CSS

Inline, right on the tag:

```html
<p style="color: hotpink;
   font-size: 2em;">LOOK AT ME</p>
```

Or a `<style>` block in your `<head>`:

```html
<style>
  body {
    background-color: darkcyan;
    font-family: serif;
  }
  p { color: white; }
</style>
```

== Resources, all optional

*val.town starter* · a template to riff on \
`https://www.val.town/x/templates/basic-html-starter`

*Neocities* · put it online, free \
`https://neocities.org`

*freeCodeCamp* · keep learning, free \
`https://www.freecodecamp.org`

*html.energy* · the movement \
`https://html.energy`
```

- [ ] **Step 2: Compile and check for one page**

Run: `typst compile handout.typ && typst compile handout.typ --format png --ppi 100 "handout-preview-{n}.png" && ls handout-preview-*.png`
Expected: exit 0, no font warnings, and exactly one file (`handout-preview-1.png`). Two or more preview files means the content overflowed to a second page: tighten by dropping code sizes to 8pt and `inset` to 5pt, or trimming blank lines inside the code examples, then re-run.

- [ ] **Step 3: Visual check**

Read `handout-preview-1.png` as an image. Confirm: two balanced columns, header spanning both, darkcyan headings, bordered code boxes, all four URLs legible and unwrapped mid-scheme, footer present, nothing clipped. Fix and re-run Step 2 if not.

- [ ] **Step 4: Wire up npm script and gitignore**

In `package.json` scripts, after `"export"`:

```json
    "export": "slidev export",
    "handout": "typst compile handout.typ"
```

Append to `.gitignore`:

```gitignore
handout.pdf
handout-preview-*.png
```

In `README.md` Usage, after the export line:

```md
- `npm run export` · PDF export
- `npm run handout` · printable cheat sheet PDF (needs [typst](https://typst.app))
```

- [ ] **Step 5: Verify script and clean status**

Run: `npm run handout && git status --short`
Expected: exit 0; status shows only `handout.typ`, `package.json`, `.gitignore`, `README.md` (no pdf/png).

- [ ] **Step 6: Commit**

```bash
git add handout.typ package.json .gitignore README.md
git commit -m "feat: typst cheat-sheet handout"
```
