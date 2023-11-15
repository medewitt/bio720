genomes:
    yq -i -P 'sort_keys(..)' glossary.yml
    typst compile main.typ
    rm docs/notes.pdf
    cp main.pdf docs/notes.pdf
    ./buildhtml.sh

signal:
    typst compile signalling.typ
    rm -f docs/signalling.pdf
    cp signalling.pdf docs/signalling.pdf
    ./buildhtml.sh

behaviour:
    typst compile behaviour.typ
    typst compile heyes.typ
    rm -f docs/behaviour.pdf
    rm -f docs/heyes.pdf
    cp heyes.pdf docs/heyes.pdf
    cp behaviour.pdf docs/behaviour.pdf
    ./buildhtml.sh

update:
    git add --all
    git commit -m "updating latest"
    git push origin main
