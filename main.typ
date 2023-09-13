#import "template.typ": *
#show: ams-article.with(
  title: "The functional spectrum of human variation notes",
  authors: (
    (
      name: "Michael DeWitt",
      department: [Department of Biology],
      organization: [Wake Forest University],
      location: [Winston Salem, NC 27101],
      email: "dewime23@wfu.edu",
      url: "www.michaeldewittjr.com"
    ),
  ),
  abstract: lorem(100),
  bibliography-file: "integratedbio.bib",
)

#set heading(numbering: "1.")

#show glossaryWords("glossary.yml"): word => glossaryShow("glossary.yml", word)


= Understanding purifying selection

The purpose of figure 3 from _An integreated map of genetic variation from 1,092 human genomes_ @the1000genomesprojectconsortiumIntegratedMapGenetic2021 is to illustrate the role of purifying selecting within and between populations.
Critically, this first requires a discussion of purifying selection.
Purifying selection is a type of background selection.
When mutations occur in the genome which are highly deleterious, offspring do not survive long enough to pass on these mutations to subsequent generations, at least on longer timescales @cvijovicEffectStrongPurifying2018.
When this background selection occurs, the observed genetic diversity is lower than what would be expected under neutral substitition.
However, these dynamics exist within the broader population level timescales and periodic deleterious mutations do appear to exist on short time scales.

The Genomic Evolutionary Rate Profiling Score (GERP) scores provide a way of measuring which sites likely lead to delertious mutations.
This statistical framework provides a way of estimating the difference between the expected number of mutations under a neutral substitution model (which assumes no impact on fitness) and the observed variation.
Positive GERP scores thus represent fewer mutations than would be expected, likely indicating a more conserved site, while negative scores would indicate more substitutions than expected.




= Figure 3

== Panel A

== Panel B

== Key conclusions



#pagebreak()

#glossary("glossary.yml")

