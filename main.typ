#import "template.typ": *
#show: ams-article.with(
  title: "Reading notes: An integrated map of genetic variation from 1,092 human genomes",
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

#block(
  fill: aqua,
  inset: 5pt,
  radius: 4pt
)[
  #text(14pt)[Objective]

  Charactertize rare variants in the human genome defined as those SNPs at 1% of the population.
]

= Data sources

The 1092 human genomes data set is comprised of a mixed of low coverage whole-genome sequence (WGS) data, which is lower coverage as there are fewer reads per sequence, targeted deep exome sequence data, and dense SNP data.
These data were gathered from 14 different populations drawing from a mixture of existing and newly collected data.
The fourteen different populations were:

- ASW: people living with African ancestry in Southwest United States (AFR)
- CEU: Utah residents with ancestry from North and Western Europe (EUR)
- CHB: Han Chinese in Beijing, China (EAS)
- CHS: Han Chinese is South, China (EAS)
- CLM: Colombians in Medellin, Columbia (AMR)
- FIN: Finnish in Finland (EUR)
- GBR: British from England and Scotland, UK (EUR)
- IBS: Iberian populations in Spain (EUR)
- LWK: Luhya in Webuye, Kenya (AFR)
- JPT: Japanese in Tokyo, Japan (EAS)
- MXL: people with Mexican ancestry in Los Angeles, Califormia (AMR)
- PUR: Puerto Ricans in Puerto Rica, USA (AMR)
- TSI: Toscani in Italia (EUR)
- YRI Yoruba in Ibadan, Nigeria (AFR)

#block(
  fill: luma(230),
  inset: 5pt,
  radius: 4pt
)[
There is some obvious selection bias in these data as many are from European or European descendents and these groupers are a bit vague.
Central Asia, India, Australia, Northern Africa and the Middle East, South Central Africa, and many Pacific islands are completely missing.
Similarly, the groupings fail to capture known unique populations (Basque in Spain) while grouping some cosmopolitans together with more murky migration history.
]

== Focus for mutations

Due to the challenges of identifying complex and large variants and shorter indels in regions of low complexity the researchers focused on:

- Biallelic indels
- Large deletions


== Power the analysis for rare variants

They calculate that their analysis is sufficiently powered to detect an SNP present at 1% of the study population at 99.3% (@fig1).
Similarly, they find that they can detect SNPs at 0.1% at over 90% power (except in the WGS data).
This is due to lower read coverage in the WGS data as there are fewer reads and thus less opportunity to separate noise/error from the processing at these lower frequencies.

The researchers used information from inferred haplotypes to enrich their data (using known familial pairings from mother-father-offspring trios).
These results were used to enrich their data and improve their power (through the use of the linkage disequilibrium, LD, as measured from these familial triads).

#figure(
  image("assets/figure1.png", width: 80%),
  caption: [a, Power to detect SNPs as a function of variant count (and proportion) across the entire set of samples, estimated by comparison to independent SNP array data in the exome (green) and whole genome (blue). b, Genotype accuracy compared with the same SNP array data as a function of variant frequency, summarized by the r2 between true and inferred genotype (coded as 0, 1 and 2) within the exome (green), whole genome after haplotype integration (blue), and whole genome without haplotype integration (red). LD, linkage disequilibrium; WGS, whole-genome sequencing.]
) <fig1>

= Genetic variation within and between populations

Many of the more _common variants_ identified in this study have been _previously described_ (94% of variants with $>=$ 5% ).
This study described some additional, less well-described variants.

#figure(
  image("assets/figure2.png", width: 80%),
  caption: [
    The distribution of rare and common variants. a, Summary of inferred haplotypes across a 100-kb region of chromosome 2 spanning the genes ALMS1 and NAT8, variation in which has been associated with kidney disease45. Each row represents an estimated haplotype, with the population of origin indicated on the right. Reference alleles are indicated by the light blue background. Variants (non-reference alleles) above 0.5% frequency are indicated by pink (typed on the high-density SNP array), white (previously known) and dark blue (not previously known). Low frequency variants (,0.5%) are indicated by blue crosses. Indels are indicated by green triangles and novel variants by dashes below. A large, low-frequency deletion (black line) spanning NAT8 is present in some populations. Multiple structural haplotypes mediated by segmental duplications are present at this locus, including copy number gains, which were not genotyped for this study. Within each population, haplotypes are ordered by total variant count across the region. b, The fraction of variants identified across the project that are found in only one population (white line), are restricted to a single ancestry-based group (defined as in a, solid colour), are found in all groups (solid black line) and all populations (dotted black line). c, The density of the expected number of variants per kilobase carried by a genome drawn from each population, as a function of variant frequency (see Supplementary Information). Colours as in a. Under a model of constant population size, the expected density is constant across the frequency spectrum.
  ]
)

== Many common variants

This study found that variants present at $>=$ 10% were found in all of the population groups.
53% of the rare variants at 0.5% were found in a single population.
They found that derived allele frequency distribution diverged below 40% such that those individuals from African backgrounds carry three times as many low-frequency mutations. 
This may reflect ancestral bottlenecks in non-African populations.
All populations shown rare variants (< 0.5 % frequency) which likely reflects the growing population sizes.

== Infering history

The researchers then examined some patterns sharing of variants (they refer to these as f_2 mutations).
These reflects some "between population" sharing of mutations such as:

- Spanish population mutations are more likely to appear in those persons from Americas rather than other European grounds
- Within East Asian populations those from Han Chinese South, China are more likely shared with Han Chinese in Beijing rather than Japan. However, Japanese mutations are more likely to be shared with those from Beijing.
- Those persons with African descent in the American Southwest have mutations shared with those from Yoruba in Nigeria than Luhya in Kenya.

They also saw interesting dynamics with the Finnish have mutations more closely related to the African populations tested (which makes sense given the relative isolation of the Finnish language).

They found a negative correlation between the variant frequency and median length of the shared haplotype (i.e., longer mutations were less likely to be shared or were less predominant).

#figure(
  image("assets/figure3.png", width: 80%),
  caption: [
a, Sharing of f2 variants, those found exactly twice across the entire sample, within and between populations. Each row represents the distribution across populations for the origin of samples sharing an f2 variant with the target population (indicated by the left-hand side). The grey bars represent the average number of f2 variants carried by a randomly chosen genome in each population. b, Median length of haplotype identity (excluding cryptically related samples and singleton variants, and allowing for up to two genotype errors) between two chromosomes that share variants of a given frequency in each population. Estimates are from 200 randomly sampled regions of 1 Mb each and up to 15 pairs of individuals for each variant. c, The average proportion of variants that are new (compared with the pilot phase of the project) among those found in regions inferred to have different ancestries within ASW, PUR, CLM and MXL populations. Error bars represent 95% bootstrap confidence intervals. NatAm, Native American.
  ]
)

== Admixture

Admixture was examined between the cosmopolitans.
On average MXL groups had the greatest proportion of Native American ancestry, but the individual variance was very high (3% to 92% despite an average of 47%).


= Understanding purifying selection

The purpose of figure 4 from _An integreated map of genetic variation from 1,092 human genomes_ @the1000genomesprojectconsortiumIntegratedMapGenetic2021 is to illustrate the role of purifying selecting within and between populations.
Critically, this first requires a discussion of purifying selection.
*Purifying selection* or negative selection is a type of background selection resulting in lower genetic diversity @cvijovicEffectStrongPurifying2018.
When mutations occur in the genome which are highly deleterious, offspring do not survive long enough to pass on these mutations to subsequent generations, at least on longer timescales @cvijovicEffectStrongPurifying2018.
When this background selection occurs, the observed genetic diversity is lower than what would be expected under neutral substitition.
However, these dynamics exist within the broader population level (longer) timescales and periodic deleterious mutations do appear to exist on shorter term time scales.
Additionally, as described by Vitti et al, "selection operates at the level of the phenotype, alleles showing evidence of selection are likely to be of funtional relevance" @vittiDetectingNaturalSelection2013.
Thus we would anticipate purifying selection to act on those alleles with functional relevance.
Figure 4 of the human genomes paper then seeks to test this hypothesis by examing the rate of rare mutations at sites with different levels of conservation and assessing the conservation of sites associated with particular functionality.

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

= Use of 1000 Genomes Project data in medical genetics

The authors argue that these data can serve as reference data for future GWAS studies.
As these data provide a "null model" for rare, low frequency, and common variants, they can provide a background for what to expect in a random sample of the population.
This null model is vital in being able to detect the relationship between phenotypic and genotypic differences. 

As they hint, the focus likely needs to be on the functionally important polymorphisms (e.g., those sites with high GERP scores) which are likely tied to function.

"Because many variants contribution to disease risk are likely to be segregating at low frequency, we recommend that variant frequency be considered when using the resource to identify pathological candidates."


#figure(
  image("assets/figure5.png", width: 80%),
  caption:[
    a, Accuracy of imputation of genome-wide SNPs, exome SNPs and indels (using sites on the Illumina 1 M array) into ten individuals of African ancestry (three LWK, four Masaai from Kinyawa, Kenya (MKK), two YRI), sequenced to high coverage by an independent technology3. Only indels in regions of high sequence complexity with frequency .1% are analysed. Deletion imputation accuracy estimated by comparison to array data46 (note that this is for a different set of individuals, although with a similar ancestry, but included on the same plot for clarity). Accuracy measured by squared Pearson correlation coefficient between imputed and true dosage across all sites in a frequency range estimated from the 1000 Genomes data. Lines represent whole-genome SNPs (solid), exome SNPs (long dashes), short indels (dotted) and large deletions (short dashes). SV, structural variants. b, The average number of variants in linkage disequilibrium (r2 . 0.5 among EUR) to focal SNPs identified in GWAS47 as a function of distance from the index SNP. Lines indicate the number of HapMap (green), pilot (red) and phase I (blue) variants.
  ]
)

= Author's discussion

== Rare variation is likely associated with complex diseases

The authors argue that understanding rare variation is important to understanding complexes diseases.
A reminder here, rare is not private, rather it is the 1% of the variants.

== Cost-effective use of combining data from multiple sources

They authors argue that their incorportation of multiple types of data has allowed for a cost-effective way of reconstructing haplotypes.
They didn't present any evidence of this directly, but rather show that WGS with LD data can allow for reconstruction.
They found many variants not in the dense reads of exons (40% not from exon reads).
They mention use of CHG array data.

== Methodological advances

They mention that while they did some interesting things (combining reads and variant calls from multiple groups), there are still limitations with long reads, duplications, etc. 

== Local differentiation through purifying selection despite metrics

The authors mention that purfying slection at functionally relevant sites can lead to substantial local differentiation despite low F#sub[ST].
Rare variants tend to be recent and restricted due to geography (or ancestry).
This suggests that local context (and inheritance) may be important for understanding particular disease phenotypes

#pagebreak()

#glossary("glossary.yml")

