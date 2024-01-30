#!/bin/bash
echo "<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
      <h1>Reading notes for<br><em>An integrated map of genetic variation from 1,092 human genomes</em></h1>
      <p></p>
      <p>To check out the latest reading notes see  <a href = "notes.pdf">here</a></p>
      <p>To check out the latest reading notes for the signalling section see  <a href = "signalling.pdf">here</a></p>
<p>To check out the latest reading notes for the Heyes et al see  <a href = "heyes.pdf">here</a></p>
<p>To check out the latest reading notes for the behaviour section see  <a href = "behaviour.pdf">here</a></p>
<p>To check out the latest reading notes for the molecular biology (Ford et al)  <a href = qmrc-ford.pdf>here</a></p>


      <p>Reading notes updated as of `date`</p>
    </body>
    <footer>
      <hr>
      <p>
        <a href="https://michaeldewittjr.com">
          main page
        </a>
      </p>
    </footer>
  </html>
" > docs/index.html
