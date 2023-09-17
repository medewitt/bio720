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
  abstract: "Caveat Emptor",
  bibliography-file: "integratedbio.bib",
)

#set heading(numbering: "1.")
#let today = datetime.today()

#show glossaryWords("glossary.yml"): word => glossaryShow("glossary.yml", word)


= Understanding purifying selection

The purpose of figure 4 from _An integreated map of genetic variation from 1,092 human genomes_ @the1000genomesprojectconsortiumIntegratedMapGenetic2021 is to illustrate the role of purifying selecting within and between populations.
Critically, this first requires a discussion of purifying selection.
*Purifying selection* or negative selection is a type of background selection resulting in lower genetic diversity @cvijovicEffectStrongPurifying2018.
When mutations occur in the genome which are highly deleterious, offspring do not survive long enough to pass on these mutations to subsequent generations, at least on longer timescales @cvijovicEffectStrongPurifying2018.
When this background selection occurs, the observed genetic diversity is lower than what would be expected under neutral substitition.
However, these dynamics exist within the broader population level (longer) timescales and periodic deleterious mutations do appear to exist on shorter term time scales.
Additionally, as described by Vitti et al, "selection operates at the level of the phenotype, alleles showing evidence of selection are likely to be of funtional relevance" @vittiDetectingNaturalSelection2013.

= Quantifying human variation

== Genomic Evolutionary Rate Profiling Score

The Genomic Evolutionary Rate Profiling Score (GERP) scores provide a way of measuring which sites likely lead to delertious mutations.
This statistical framework provides a way of estimating the difference between the expected number of mutations under a neutral substitution model (which assumes no impact on fitness) and the observed variation.
Positive GERP scores thus represent fewer mutations than would be expected, likely indicating a more conserved site, while negative scores would indicate more substitutions than expected.
Put another way, we would expect that high GERP scores will occur in regions which are important for survival to reproductive age and are largely conserved in the population (i.e., at higher levels in the population with fewer mutations in these regions).

== Derived Allele Frequency

We can examine the derived allele frequency (DAP) to assess the overall distribution of alleles within a population.
As a reminder, a derived allele are variants which have arisen since the last common ancestor.
The derived allele frequency is then a summarization of the pattern and frequency that these variant alleles appear.
Taking the population sampled as a whole we can calculate the frequency with which each allele variant appears. 

= Examination of Figure 3

== Panel A

In @fig4a we see the following:

- X-axis: the GERP score representing the evolutionary conservation where higher scores are more conserved.
- Y-axis: the proportion of variants with a DAF < 0.5% where higher values indicate lower frequencies in the studied population
- Colored lines: the different functional elements
- cross on the x and y axes representing the average values for GERP score and proportion of variants with a DAF < 0.5%, respectively.

From this figure we can conclude that:
- More generally, there are fewer mutation observed in more highly conserved sites (i.e., higher GERP scores and higher proportions).
- Specifically, we see that additional Stop codons, Splice mutations, and non-synonymous (Nonsyn) mutations appear very rare and are likely associated with deleterious effects. Later in the paper these are identified as "loss of function" mutations.
- The addition of Stop codons continues to be relatively rare at most sites across GERP scores. This implies that the addition of the codons likely results in a severe loss of function. As stop codons stop transcription prematurely, these additions will result in macromolecules not being transcribed more generally. This patern is similar amongst the splice mutations which impact the assembly of said macromolecules.
- We see an interesting phenomena with splice variants having higher mutation in less conserved locations.
- The authors note that rare variant loads are similar for synomynous and nonsynomynous locations suggesting weak selective constraints

#figure(
    image("assets/figure4a.png", width: 60%),
    caption: [The relationaship between evolutionary conservation (measured by GERP score) and rare variant proportion (fraction of all variants weith derived allele frequency (DAF) < 5% )for variants occurring in different functional elements and with different coding consequences. Crosses indicate the average GERP score at variant sites (x axis) and the proportion of rare variants (y axis) in each category.],
) <fig4a>

== Panel B

In @fig4b examines the CTCF-binding motif within the CTCF-binding peaks.
The transcription repressor CTCF has been characterized as playing a vital role in transcription regulation including the recombination of the antibody loci and the regulation of chromatin architecture #cite("filippovaExceptionallyConservedTranscriptional1996", "cooperDistributionIntensityConstraint2005").
Intuitively, we would expect relatively low diversity in this gene as chromatin structural formation is vital for transcription (and cellular generation more generally).

The binding motif is shown in the picto-graphic (called the "logo plot") for the actual nucleotide.
In all cases, red represents the "out peak"  and blue represents the "in peak" from the Chip-seq (ChipSeq) analysis which is used to map binding sites.
Those sites that are located within the peak are likely related to binding and associated with function.
The in peak is the mapped functional/ active site of the CTCF gene while the out peak represents the CTCF motif, but not on the CTCF gene.
This indicates that the conservation and lower diversity rates are active site conserving (preserving functionality of the gene).

=== Upper panel

The y axis again represents the GERP score in the different regions. Higher values represent more likely to be a conserved region as it changes less than expected under a natural substitution model.

=== Lower panel

The y axis represents the average diversity as defined as the per-nucleotide pairwise distance with higher values representing more differences (i.e., more distance and differences)

=== Figure conclusions

As suspected, in an important gene we see that those sites associated with function ("in peak") vary less than expected under natural substition as shown by the GERP scores and lower pair-wise nucleotide distances in the lower panel.
This is not to say that there isn't a more complex story as there is a hint of degeneracy in position 8.

#figure(
    image("assets/figure4b.png", width: 60%),
    caption: [Levels of evolutionary conservation (mean GERP score, top) and genetic diversity (per-nucleotide pairwise differences, bottom) for the sequences matching the CTCF-binding motif within CTCF-binding peaks, as identified experimentally by ChIP-seq in the ENCODE project (blue) and in a matched set of motifs outside peaks (red). The logo plot shows the distribution of identified motifs within peaks.],
) <fig4b>

== Key conclusions

There are some highly conserved regions and likely purifying selection is driven by the addition of stop codons, splice mutations, and non-synomynous mutations at these conserved sites due to their lower observed frequencies of occuring.


#pagebreak()

#glossary("glossary.yml")

