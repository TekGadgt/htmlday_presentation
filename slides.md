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
