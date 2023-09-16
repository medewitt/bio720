default:
    typst compile main.typ
    rm docs/notes.pdf
    cp main.pdf docs/notes.pdf
    bash buildhtml
