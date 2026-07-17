# HTML Day Freewrite Deck Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a 14-slide Slidev deck for the Hampton Roads HTML Day Freewrite (Aug 8, 2026, ECPI Virginia Beach), themed after the event announcement page, with a toggle-able whimsy layer and QR-coded resources.

**Architecture:** Single `slides.md` deck on Slidev's built-in default theme. A root `style.css` recreates the announcement page look (darkcyan background, `#f9f9f9` bordered content boxes, Times New Roman). A `global-top.vue` layer renders a Win95-style whimsy toggle whose state lives in a shared composable.

**Tech Stack:** Slidev (`@slidev/cli` ^52.14.2), `@slidev/theme-default`, `qrcode.vue` ^3.8.1, `playwright-chromium` (for export/screenshots).

## Global Constraints

- Slide copy is light on em dashes. Use periods, commas, or middots instead.
- Do NOT teach or list `<marquee>` as a tag. (The whimsy layer's CSS-animated crawl is fine; the deprecated element is not taught.)
- Whimsy content is original: no reuse of the announcement page's gifs, marquee copy, audio, or `adfa6df.png`. No audio anywhere.
- Whimsy is OFF by default and toggle-able from any slide; state persists across slide navigation.
- Palette: `darkcyan` background, `#f9f9f9` boxes, `1px solid #ddd` borders, default browser serif (Times New Roman).
- Event facts (use verbatim): Saturday, August 8, 2026 · 10:00 AM to 2:00 PM · ECPI Main Campus, 5555 Greenwich Rd, Virginia Beach, VA 23462. Hosts: Austin Galyon, Chazona Baum, Ryan McGovern.
- Resource URLs: https://www.val.town/x/templates/basic-html-starter · https://neocities.org · https://www.freecodecamp.org · https://html.energy
- Working directory: `/Users/tekgadgt/projects/htmlday_presentation` (already a git repo on `main`).

---

### Task 1: Project scaffold

**Files:**
- Create: `.gitignore`
- Create: `package.json`
- Create: `slides.md` (minimal, title slide only; Task 4 replaces it)

**Interfaces:**
- Produces: npm scripts `dev`, `build`, `export`; a running Slidev project later tasks build on.

- [ ] **Step 1: Write `.gitignore`**

```gitignore
node_modules/
dist/
*.local
.vite-inspect/
.remote-assets/
components.d.ts
```

- [ ] **Step 2: Write `package.json`**

```json
{
  "name": "htmlday-freewrite-presentation",
  "private": true,
  "version": "1.0.0",
  "scripts": {
    "dev": "slidev --open",
    "build": "slidev build --base /",
    "export": "slidev export"
  },
  "devDependencies": {
    "@slidev/cli": "^52.14.2",
    "@slidev/theme-default": "^0.25.0",
    "playwright-chromium": "^1.59.1"
  },
  "dependencies": {
    "qrcode.vue": "^3.8.1"
  }
}
```

- [ ] **Step 3: Write minimal `slides.md`**

```md
---
theme: default
title: Hampton Roads HTML Day
info: HTML Freewrite · August 8, 2026 · ECPI Virginia Beach
class: text-center
colorSchema: light
fonts:
  provider: none
---

# Hampton Roads HTML Day!

An HTML Freewrite
```

- [ ] **Step 4: Install dependencies**

Run: `npm install`
Expected: completes without errors; `node_modules/` exists.

- [ ] **Step 5: Verify the build works**

Run: `npm run build`
Expected: exits 0; `dist/index.html` exists.

- [ ] **Step 6: Commit**

```bash
git add .gitignore package.json package-lock.json slides.md
git commit -m "feat: scaffold slidev project"
```

---

### Task 2: Announcement-page theme stylesheet

**Files:**
- Create: `style.css` (Slidev auto-loads a root `style.css`)

**Interfaces:**
- Produces: CSS classes `.host-photo` and `.qr-box` used by Task 4's slides; `body.whimsy` hook used by Task 5's toggle.

- [ ] **Step 1: Write `style.css`**

```css
:root {
  --htmlday-teal: darkcyan;
  --htmlday-paper: #f9f9f9;
  --htmlday-border: #ddd;
}

/* Raw 2003 look: darkcyan page, gray paper box, browser serif */
.slidev-layout {
  background: var(--htmlday-teal);
  color: #111;
  font-family: 'Times New Roman', Times, serif;
  padding: 3.5rem 4rem;
}

.slidev-layout::before {
  content: '';
  position: absolute;
  inset: 1.6rem;
  background: var(--htmlday-paper);
  border: 1px solid var(--htmlday-border);
  z-index: 0;
}

.slidev-layout > * {
  position: relative;
  z-index: 1;
}

.slidev-layout h1,
.slidev-layout h2,
.slidev-layout h3 {
  font-family: 'Times New Roman', Times, serif;
  font-weight: bold;
  color: #111;
}

.slidev-layout a {
  color: #0000ee;
  border-bottom: none;
  text-decoration: underline;
}

.slidev-layout code {
  background: #eee;
  border: 1px solid var(--htmlday-border);
  border-radius: 0;
  padding: 0.05em 0.3em;
  color: #111;
}

.slidev-layout pre {
  border: 1px solid var(--htmlday-border);
  border-radius: 0;
}

.host-photo {
  width: 170px;
  height: 170px;
  object-fit: cover;
  border: 1px solid var(--htmlday-border);
  background: #fff;
  padding: 4px;
}

.host-photo-sm {
  width: 90px;
  height: 90px;
  object-fit: cover;
  border: 1px solid var(--htmlday-border);
  background: #fff;
  padding: 2px;
}

.qr-box {
  background: #fff;
  border: 1px solid var(--htmlday-border);
  padding: 12px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

/* Whimsy layer hook: polka-dot tile over the darkcyan frame (CSS-made, original) */
body.whimsy .slidev-layout {
  background-color: var(--htmlday-teal);
  background-image:
    radial-gradient(rgba(255, 255, 255, 0.25) 12%, transparent 13%),
    radial-gradient(rgba(0, 0, 0, 0.15) 12%, transparent 13%);
  background-size: 60px 60px;
  background-position: 0 0, 30px 30px;
}
```

- [ ] **Step 2: Verify the build still works**

Run: `npm run build`
Expected: exits 0.

- [ ] **Step 3: Commit**

```bash
git add style.css
git commit -m "feat: raw-HTML announcement-page theme"
```

---

### Task 3: Host photos

**Files:**
- Create: `public/photos/` (Ryan's and Austin's photos copied from pantry party; Chazona's moved from project root)

**Interfaces:**
- Produces: `/photos/IMG_3831.jpg` (Ryan), `/photos/ag-webdev-cropped.jpeg` (Austin), `/photos/chazona.jpg` (Chazona), referenced by Task 4's slides.

- [ ] **Step 1: Copy and move photos**

```bash
mkdir -p public/photos
cp ~/projects/pantry_party_presentation/public/photos/IMG_3831.jpg public/photos/
cp ~/projects/pantry_party_presentation/public/photos/ag-webdev-cropped.jpeg public/photos/
git mv chazona.jpg public/photos/chazona.jpg 2>/dev/null || mv chazona.jpg public/photos/chazona.jpg
```

- [ ] **Step 2: Verify all three exist**

Run: `ls public/photos/`
Expected: `IMG_3831.jpg  ag-webdev-cropped.jpeg  chazona.jpg`

- [ ] **Step 3: Commit**

```bash
git add public/photos
git commit -m "feat: add host photos"
```

---

### Task 4: Full slide content

**Files:**
- Modify: `slides.md` (replace entirely with the content below)

**Interfaces:**
- Consumes: `.host-photo`, `.host-photo-sm`, `.qr-box` from Task 2; `/photos/*` from Task 3; `qrcode.vue` from Task 1.

- [ ] **Step 1: Replace `slides.md` with the full deck**

````md
---
theme: default
title: Hampton Roads HTML Day
info: HTML Freewrite · August 8, 2026 · ECPI Virginia Beach
class: text-center
colorSchema: light
fonts:
  provider: none
---

# Hampton Roads HTML Day!

<div class="pt-2 text-2xl">An HTML Freewrite</div>

<div class="pt-10 text-xl">Saturday, August 8, 2026 · 10 AM to 2 PM</div>

<div class="pt-2 text-lg opacity-80">ECPI Main Campus · 5555 Greenwich Rd, Virginia Beach</div>

<!--
Sits up while folks arrive. Welcome people in.
-->

---
class: text-center
---

# Your hosts

<div class="flex justify-center gap-12 pt-6">
  <div class="text-center">
    <img src="/photos/ag-webdev-cropped.jpeg" class="host-photo mx-auto" />
    <div class="pt-3 text-xl">Austin Galyon</div>
  </div>
  <div class="text-center">
    <img src="/photos/chazona.jpg" class="host-photo mx-auto" />
    <div class="pt-3 text-xl">Chazona Baum</div>
  </div>
  <div class="text-center">
    <img src="/photos/IMG_3831.jpg" class="host-photo mx-auto" />
    <div class="pt-3 text-xl">Ryan McGovern</div>
  </div>
</div>

<div class="pt-8 opacity-80">Questions any time. Flag one of us down.</div>

---

# HTML is writing

<div class="text-xl pt-4">

You type words. You save the file as `.html`. You open it in a browser.

**You made a website.** That's the whole trick.

</div>

<v-click>

<div class="text-lg pt-6 opacity-90">

No frameworks, no build tools, no magic behind the curtain. HTML is forgiving by design, it runs on anything, and every page is readable by anyone who hits "view source."

</div>

</v-click>

<!--
The html.energy philosophy. Slow down here, this is the whole event in one slide.
-->

---

# How today works

<div class="text-xl pt-4">

1. **Hello** · you're doing it right now
2. **Crash course** · a few slides of HTML basics, totally optional
3. **Freewrite** · about an hour of making whatever you want
4. **Sharing** · show your page if you feel like it, no pressure

</div>

<div class="pt-8 opacity-80">There is no wrong way to do this.</div>

---
class: text-center
---

# Thank you!

<div class="text-xl pt-6">

**ECPI** is hosting us in this space today.

</div>

<div class="text-xl pt-4">

**val.town** provided the coffee and pastries,<br>
plus an HTML starter template you'll see in the resources.

</div>

<div class="pt-10 opacity-80">Grab a coffee. Thank a sponsor.</div>

---

# AI policy

<div class="text-xl pt-4">

This is an AI-free event.

Hands on keys, write your own HTML like it's 2003.

</div>

<v-click>

<div class="text-lg pt-6 opacity-90">

We can't frisk you at the door, but the whole point is the making. Leave the generators at home and build the thing yourself.

</div>

</v-click>

---

# All you need

<div class="text-xl pt-4">

1. Open TextEdit, Notepad, or any text editor
2. Write some words
3. Save the file as `mypage.html`
4. Double-click it

</div>

<div class="pt-6 text-xl">That's a website. You're done. Everything from here on is <strong>optional</strong>.</div>

<div class="pt-4 text-sm opacity-70">TextEdit users: Format menu → Make Plain Text, first.</div>

---

# HTML in one slide

```html
<!DOCTYPE html>
<html>
  <head>
    <title>my page</title>
  </head>
  <body>
    <h1>A big heading</h1>
    <p>A paragraph of whatever you want to say.</p>
  </body>
</html>
```

<div class="pt-4 opacity-80">Honestly, even this is optional. The browser forgives whatever you skip.</div>

---

# HTML in one more slide

```html
<a href="https://html.energy">a link to anywhere</a>

<img src="cat.jpg" alt="my cat">

<ul>
  <li>a list</li>
  <li>of things</li>
</ul>

<ol>
  <li>or in order</li>
</ol>
```

<div class="pt-4 opacity-80">Links are the web. One anchor tag and your page is connected to everything.</div>

---

# Fun tags to try

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

<div class="pt-4 opacity-80">These all work with zero CSS. View source on any site to find more.</div>

---

# A dab of CSS

Inline, right on the tag:

```html
<p style="color: hotpink; font-size: 2em;">LOOK AT ME</p>
<body style="background-color: darkcyan;">
```

Or a `<style>` block in your `<head>`:

```html
<style>
  body { background-color: darkcyan; font-family: serif; }
  p { color: white; }
</style>
```

<div class="pt-4 opacity-80">That's enough CSS for today. Go make something.</div>

---

# Freewrite prompts

<div class="text-xl pt-4">

- A page that calms you down
- A letter to a childhood memory
- A shrine to your favorite sandwich
- A page using a tag you've never used
- Your own tiny corner of the internet, about anything

</div>

<div class="pt-6 opacity-80">Or ignore all of these. It's a freewrite.</div>

---
class: text-center
---

<script setup>
import QrcodeVue from 'qrcode.vue'
</script>

# Resources · all optional

<div class="flex justify-center gap-8 pt-6">
  <div class="text-center">
    <div class="qr-box"><QrcodeVue value="https://www.val.town/x/templates/basic-html-starter" :size="140" level="H" /></div>
    <div class="pt-2 text-base">val.town starter<br><span class="opacity-70 text-sm">a template to riff on</span></div>
  </div>
  <div class="text-center">
    <div class="qr-box"><QrcodeVue value="https://neocities.org" :size="140" level="H" /></div>
    <div class="pt-2 text-base">Neocities<br><span class="opacity-70 text-sm">put it online, free</span></div>
  </div>
  <div class="text-center">
    <div class="qr-box"><QrcodeVue value="https://www.freecodecamp.org" :size="140" level="H" /></div>
    <div class="pt-2 text-base">freeCodeCamp<br><span class="opacity-70 text-sm">keep learning, free</span></div>
  </div>
  <div class="text-center">
    <div class="qr-box"><QrcodeVue value="https://html.energy" :size="140" level="H" /></div>
    <div class="pt-2 text-base">html.energy<br><span class="opacity-70 text-sm">the movement</span></div>
  </div>
</div>

<div class="pt-6 opacity-80">A laptop and a text file are still all you need. These are extras.</div>

---
class: text-center
---

<script setup>
import QrcodeVue from 'qrcode.vue'
</script>

# Go write!

<div class="flex justify-center gap-10 pt-4 items-start">
  <div class="text-center">
    <div class="flex justify-center gap-4">
      <div class="text-center">
        <img src="/photos/ag-webdev-cropped.jpeg" class="host-photo-sm mx-auto" />
        <div class="pt-1 text-sm">Austin</div>
      </div>
      <div class="text-center">
        <img src="/photos/chazona.jpg" class="host-photo-sm mx-auto" />
        <div class="pt-1 text-sm">Chazona</div>
      </div>
      <div class="text-center">
        <img src="/photos/IMG_3831.jpg" class="host-photo-sm mx-auto" />
        <div class="pt-1 text-sm">Ryan</div>
      </div>
    </div>
    <div class="pt-2 text-base opacity-80">Stuck? Flag us down.</div>
  </div>
  <div class="flex gap-4">
    <div class="text-center">
      <div class="qr-box"><QrcodeVue value="https://www.val.town/x/templates/basic-html-starter" :size="90" level="H" /></div>
      <div class="pt-1 text-sm">starter</div>
    </div>
    <div class="text-center">
      <div class="qr-box"><QrcodeVue value="https://neocities.org" :size="90" level="H" /></div>
      <div class="pt-1 text-sm">Neocities</div>
    </div>
    <div class="text-center">
      <div class="qr-box"><QrcodeVue value="https://www.freecodecamp.org" :size="90" level="H" /></div>
      <div class="pt-1 text-sm">freeCodeCamp</div>
    </div>
  </div>
</div>

<div class="pt-8 text-sm opacity-70">
  Space by ECPI · Coffee, pastries, and starter template by val.town
</div>

<!--
Resting slide. Park here during the writing hour.
-->
````

- [ ] **Step 2: Verify the build**

Run: `npm run build`
Expected: exits 0, no Vue compile errors.

- [ ] **Step 3: Commit**

```bash
git add slides.md
git commit -m "feat: full 14-slide deck content"
```

---

### Task 5: Whimsy toggle

**Files:**
- Create: `composables/whimsy.ts`
- Create: `global-top.vue` (Slidev auto-mounts a root `global-top.vue` on every slide view)

**Interfaces:**
- Consumes: `body.whimsy` CSS hook from Task 2.
- Produces: exported `whimsy: Ref<boolean>` from `composables/whimsy.ts`.

- [ ] **Step 1: Write `composables/whimsy.ts`**

```ts
import { ref } from 'vue'

// Module-level singleton so the toggle persists across slide navigation
export const whimsy = ref(false)
```

- [ ] **Step 2: Write `global-top.vue`**

```vue
<script setup lang="ts">
import { watchEffect } from 'vue'
import { whimsy } from './composables/whimsy'

watchEffect(() => {
  document.body.classList.toggle('whimsy', whimsy.value)
})
</script>

<template>
  <button class="whimsy-toggle" @click="whimsy = !whimsy">
    <span v-if="!whimsy">🪄 whimsy?</span>
    <span v-else>🚫 ok, that's plenty</span>
  </button>

  <template v-if="whimsy">
    <div class="whimsy-marquee">
      <span class="whimsy-marquee-content">
        hands on keys · just a text file and a browser · no builds, no frameworks, no fuss · view source forever · you are the website now ·
      </span>
    </div>
    <span class="whimsy-float" style="left: 3%; top: 14%; animation-delay: 0s">✍️</span>
    <span class="whimsy-float" style="left: 93%; top: 16%; animation-delay: 1.2s">🌐</span>
    <span class="whimsy-float" style="left: 92%; top: 80%; animation-delay: 0.6s">☕</span>
    <span class="whimsy-float" style="left: 4%; top: 82%; animation-delay: 1.8s">📄</span>
  </template>
</template>

<style scoped>
/* Win95-style beveled button, same construction as the event page toggle */
.whimsy-toggle {
  position: fixed;
  bottom: 0.6rem;
  right: 0.6rem;
  z-index: 100;
  background-color: lightgray;
  border: 1px solid #000;
  border-top-color: #fff;
  border-left-color: #fff;
  box-shadow: 1px 1px 0 0 #000, -1px -1px 0 0 #dfdfdf;
  font-family: 'Times New Roman', Times, serif;
  font-weight: bold;
  font-size: 0.8rem;
  color: #111;
  padding: 4px 12px;
  cursor: pointer;
  user-select: none;
}

.whimsy-toggle:active {
  border-color: #fff;
  border-top-color: #000;
  border-left-color: #000;
  box-shadow: 1px 1px 0 0 #c0c0c0;
  padding: 5px 11px 3px 13px;
}

.whimsy-marquee {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 90;
  overflow: hidden;
  white-space: nowrap;
  color: red;
  background: #f9f9f9;
  border-bottom: 1px solid #ddd;
  font-family: 'Times New Roman', Times, serif;
  font-size: 1rem;
  pointer-events: none;
}

.whimsy-marquee-content {
  display: inline-block;
  padding-left: 100vw;
  animation: whimsy-scroll 18s linear infinite;
}

@keyframes whimsy-scroll {
  to {
    transform: translateX(-100%);
  }
}

.whimsy-float {
  position: fixed;
  z-index: 90;
  font-size: 1.6rem;
  pointer-events: none;
  animation: whimsy-bob 3s ease-in-out infinite;
}

@keyframes whimsy-bob {
  0%,
  100% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(-12px);
  }
}
</style>
```

- [ ] **Step 3: Verify the build**

Run: `npm run build`
Expected: exits 0, no TypeScript or Vue compile errors.

- [ ] **Step 4: Commit**

```bash
git add composables/whimsy.ts global-top.vue
git commit -m "feat: toggle-able whimsy layer"
```

---

### Task 6: Visual verification and README

**Files:**
- Create: `README.md`
- Create: `screenshots/` (gitignored scratch output, do not commit)

**Interfaces:**
- Consumes: the complete deck from Tasks 1 through 5.

- [ ] **Step 1: Export slides as PNGs**

Run: `npx slidev export --format png --output screenshots --timeout 60000`
Expected: exits 0; `screenshots/` contains 14 PNGs.

- [ ] **Step 2: Inspect key slides**

Read (as images) `screenshots/001.png` (title), `screenshots/002.png` (hosts, all three photos render), `screenshots/013.png` (resources, four QR codes in white boxes), `screenshots/014.png` (resting slide). Confirm: darkcyan frame with gray paper box on every slide, serif type, photos and QR codes visible, no content overflowing the paper box. Fix any layout issues in `slides.md` or `style.css` and re-export before proceeding.

- [ ] **Step 3: Add `screenshots/` to `.gitignore`**

Append to `.gitignore`:

```gitignore
screenshots/
```

- [ ] **Step 4: Write `README.md`**

```md
# HTML Day Freewrite Deck

Slides for the Hampton Roads HTML Day Freewrite.
Saturday, August 8, 2026 · 10 AM to 2 PM · ECPI Main Campus, Virginia Beach.

## Usage

- `npm install`
- `npm run dev` · present locally
- `npm run build` · static build in `dist/`
- `npm run export` · PDF export

## Notes

- The 🪄 button (bottom right) toggles the whimsy layer. It's off by default.
- The last slide is the resting slide; park there during the writing hour.
- Before the event: scan every QR code from a phone against the projected screen.
```

- [ ] **Step 5: Verify a clean final build**

Run: `npm run build && git status --short`
Expected: build exits 0; `git status` shows only `.gitignore` and `README.md` as changes.

- [ ] **Step 6: Commit**

```bash
git add .gitignore README.md
git commit -m "docs: README and visual verification"
```
