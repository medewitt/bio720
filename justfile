default:
    yq -i -P 'sort_keys(..)' glossary.yml
    typst compile main.typ
    rm docs/notes.pdf
    cp main.pdf docs/notes.pdf
    ./buildhtml.sh

update:
    git add --all
    git commit -m "updating latest"
    git push origin main