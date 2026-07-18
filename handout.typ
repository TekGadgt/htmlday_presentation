#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 0.55in),
  columns: 2,
  footer: align(center, text(size: 8pt, fill: rgb("#666666"))[
    Space by ECPI · Coffee, pastries, and starter template by val.town
  ]),
)
#set columns(gutter: 22pt)
#set text(font: "Times New Roman", size: 10pt)
#set par(justify: false)
#set enum(tight: true)

#show heading.where(level: 2): it => {
  v(5pt, weak: true)
  text(fill: rgb("#008b8b"), size: 12.5pt, weight: "bold", it.body)
  v(4pt, weak: true)
}

#show raw.where(block: true): it => block(
  fill: rgb("#f9f9f9"),
  stroke: 0.5pt + rgb("#dddddd"),
  inset: 6pt,
  width: 100%,
  text(size: 9pt, it),
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
