#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 11.74988pt
#let today = datetime.today()

// This function gets your whole document as its `body` and formats
// it as an article in the style of the American Mathematical Society.
#let ams-article(
  // The article's title.
  title: "Paper title",

  // An array of authors. For each author you can specify a name,
  // department, organization, location, and email. Everything but
  // but the name is optional.
  authors: (),

  // Your article's abstract. Can be omitted if you don't have one.
  abstract: none,

  // The article's paper size. Also affects the margins.
  paper-size: "us-letter",

  // The path to a bibliography file if you want to cite some external
  // works.
  bibliography-file: none,

  // The document's content.
  body,
) = {
  // Formats the author's names in a list with commas and a
  // final "and".
  let names = authors.map(author => author.name)
  let author-string = if authors.len() == 2 {
    names.join(" and ")
  } else {
    names.join(", ", last: ", and ")
  }

  // Set document metadata.
  set document(title: title, author: names)

  // Set the body font. AMS uses the LaTeX font.
  set text(size: normal-size, font: "New Computer Modern")

  // Configure the page.
  set page(
    paper: paper-size,
    // The margins depend on the paper size.
    margin: if paper-size != "a4" {
      (
        top: (80pt / 279mm) * 100%,
        left: (80pt / 216mm) * 100%,
        right: (80pt / 216mm) * 100%,
        bottom: (80pt / 279mm) * 100%,
      )
    } else {
      (
        top: 117pt,
        left: 80pt,
        right: 80pt,
        bottom: 96pt,
      )
    },

    // The page header should show the page number and list of
    // authors, except on the first page. The page number is on
    // the left for even pages and on the right for odd pages.
    header-ascent: 14pt,
    header: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 { return }
      set text(size: script-size)
      grid(
        columns: (6em, 1fr, 6em),
        today.display() ,
        align(center, upper(
          if calc.odd(i) { title } else { author-string }
        )),
        align(right)[#i]
      )
    }),

    // On the first page, the footer should contain the page number.
    footer-descent: 12pt,
    footer: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 {
        align(center, text(size: script-size, [#i]))
      }
    })
  )

  // Configure headings.
  set heading(numbering: "1.")
  show heading: it => {
    // Create the heading numbering.
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      h(7pt, weak: true)
    }

    // Level 1 headings are centered and smallcaps.
    // The other ones are run-in.
    set text(size: normal-size, weight: 400)
    if it.level == 1 {
      set align(center)
      set text(size: normal-size)
      smallcaps[
        #v(15pt, weak: true)
        #number
        #it.body
        #v(normal-size, weak: true)
      ]
      counter(figure.where(kind: "theorem")).update(0)
    } else {
      v(11pt, weak: true)
      number
      let styled = if it.level == 2 { strong } else { emph }
      styled(it.body + [. ])
      h(7pt, weak: true)
    }
  }

  // Configure lists and links.
  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)
  show link: set text(font: "New Computer Modern Mono")

  // Configure equations.
  show math.equation: set block(below: 8pt, above: 9pt)
  show math.equation: set text(weight: 400)

  // Configure citation and bibliography styles.
  set cite(style: "numerical", brackets: true)
  set bibliography(style: "ieee", title: "References")

  show figure: it => {
    show: pad.with(x: 23pt)
    set align(center)

    v(12.5pt, weak: true)

    // Display the figure's body.
    it.body

    // Display the figure's caption.
    if it.has("caption") {
      // Gap defaults to 17pt.
      v(if it.has("gap") { it.gap } else { 17pt }, weak: true)
      smallcaps(it.supplement)
      if it.numbering != none {
        [ ]
        it.counter.display(it.numbering)
      }
      [. ]
      it.caption
    }

    v(15pt, weak: true)
  }

  // Theorems.
  show figure.where(kind: "theorem"): it => block(above: 11.5pt, below: 11.5pt, {
    strong({
      it.supplement
      if it.numbering != none {
        [ ]
        counter(heading).display()
        it.counter.display(it.numbering)
      }
      [.]
    })
    emph(it.body)
  })

  // Display the title and authors.
  v(35pt, weak: true)
  align(center, upper({
    text(size: large-size, weight: 700, title)
    v(25pt, weak: true)
    text(size: footnote-size, author-string)
  }))

  // Configure paragraph properties.
  set par(first-line-indent: 1.2em, justify: true, leading: 0.58em)
  show par: set block(spacing: 0.58em)

  // Display the abstract
  if abstract != none {
    v(20pt, weak: true)
    set text(script-size)
    show: pad.with(x: 35pt)
    abstract
  }

  // Display the article's contents.
  v(29pt, weak: true)
  body

  // Display the bibliography, if any is given.
  if bibliography-file != none {
    show bibliography: set text(8.5pt)
    show bibliography: pad.with(x: 0.5pt)
    bibliography(bibliography-file)
  }

  // The thing ends with details about the authors.
  show: pad.with(x: 11.5pt)
  set par(first-line-indent: 0pt)
  set text(7.97224pt)

  for author in authors {
    let keys = ("department", "organization", "location")

    let dept-str = keys
      .filter(key => key in author)
      .map(key => author.at(key))
      .join(", ")

    smallcaps(dept-str)
    linebreak()

    if "email" in author [
      _Email address:_ #link("mailto:" + author.email) \
    ]

    if "url" in author [
      _URL:_ #link(author.url)
    ]

    v(12pt, weak: true)
  }
}

// The ASM template also provides a theorem function.
#let theorem(body, numbered: true) = figure(
  body,
  kind: "theorem",
  supplement: [Theorem],
  numbering: if numbered { "1" },
)

// And a function for a proof.
#let proof(body) = block(spacing: 11.5pt, {
  emph[Proof.]
  [ ] + body
  h(1fr)
  box(scale(160%, origin: bottom + right, sym.square.stroked))
})

// Adding in glossary elements

// Generate a regex that matches all the words in glossary named filename
#let glossaryWords(filename) = {
  let pipeList = "(?i:" // Match case insensitively
  for word in yaml(filename).keys() {
    pipeList += "\b" + word + "\b|" // Stop at word boundaries to not match inside other words
  }
  return regex(pipeList.slice(0, pipeList.len()-1) + ")") // Remove trailing pipe & close parenthesis
}

// Return the position of the word word in the glossary filename as dictionaries don’t implement find-like methods
#let glossaryPosition(filename, word) = {
  let count = 0
  for key in yaml(filename).keys() {
    count += 1
    if lower(key) == lower(word) {return count} // Search case-insensitively by lowering everything
  }
  assert(false, message: word + " not found in glossary but matched in regex") // Debug
}

// For a given word and glossary file, return the word augmented with a link to the glossary
#let glossaryShow(filename, word) = {
  word = repr(word)
  word = word.trim(regex("\s|\[|\]")) // Trim brackets generated by repr() and whitespaces
  return {
    show link: set text(size: 9pt)
    show link: set underline(stroke: 0pt) // I didn’t succeed to disable previous show-set
    // Insert an invisible char into the word to prevent show from looping on itself
    word.first() + "‎" + word.slice(1) // Unicode empty character
    link(label("glossary"), "(" + str(glossaryPosition(filename, word)) + ")"); " "
  }
}

// Display the words of the glossary with their definition & their eventual web links
#let glossary(filename, title: "Glossary") = {
  let data = yaml(filename)
  // let labelCount = 0
  if data.len() > 0 [
    #heading(title, numbering: none) #label("glossary")

  ]
  for (word, info) in data {
    [/ #word: #info.definition\ → #if "link" in info {link(info.link)}]
    // label("glo" + str(labelCount)) // Try to link words to their specific definition
    // labelCount += 1
  }
}