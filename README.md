# ImpactFactor

Analysis of the impact factors of journals in the categories "Ecology" (JCR) and "Biodiversity" (CAPES).

[Ecological Synthesis Lab](https://marcomellolab.wordpress.com) (SintECO).

Author: Marco A. R. Mello.

E-mail: marmello@usp.br. 

Published on September 24th, 2020 (English version).

Run in R version 4.0.2 (2020-06-22) -- "Taking Off Again".

Disclaimer: You may freely use the software provided here for commercial or non-commercial purposes at your own risk. We assume no responsibility or liability for the use of this software, convey no license or title under any patent, copyright, or mask work right to the product. We reserve the right to make changes in the software without notification. We also make no representation or warranty that such application will be suitable for the specified use without further testing or modification. If this software helps you produce any academic work (paper, book, chapter, monograph, dissertation, report or similar), please acknowledge the authors and cite the source.


## Functionality

This is a simple script to run some scientometric analyses.

For CAPES, a major Brazilian science funding agency, Biodiversity = Ecology + Oceanography + Zoology + Plant Sciences.


## Data source

[Journal Citation Reports](https://jcr.clarivate.com) (aka JCR).


## List of folders and files

1. data (folder)

    a. jcr ecology 2018.csv -> raw data from journals classified in JCR's category Ecology.
  
    b. jcr oceanography 2018.csv -> raw data from journals classified in JCR's category Oceanography.
  
    c. jcr plant sciences 2018.csv -> raw data from journals classified in JCR's category Plant Sciences.
  
    d. jcr zoology 2018.csv -> raw data from journals classified in JCR's category Zoology.

2. jc.R -> R script to run the analysis and plot the graphs.

3. biodiversity 2018.png -> plot with the distribution of impact factors in CAPES's category Biodiversity.

4. ecology 2018.png -> plot with the distribution of impact factors in JCR's category Ecology.

