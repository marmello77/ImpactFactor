# ImpactFactor

Impact factor analysis of journals classified in the categories "Ecology" (JCR) and "Biodiversity" (CAPES).

[Ecological Synthesis Lab](https://marcomellolab.wordpress.com) (SintECO).

Author: Marco Mello.

E-mail: marmello@usp.br. 

First published on September 24th, 2020 (English version).

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4106803.svg)](https://doi.org/10.5281/zenodo.4106803)

Run in R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out".

Disclaimer: You may freely use the software provided here for any purposes at your own risk. We assume no responsibility or liability for the use of this software, convey no license or title under any patent, copyright, or mask work right to the product. We reserve the right to make changes in the software without notification. We also make no representation or warranty that such application will be suitable for the specified use without further testing or modification. If this software helps you produce any academic work (paper, book, chapter, monograph, dissertation, report, talk, keynote, lecture or similar), please acknowledge the authors and cite the source.


## Functionality and origin

You can use this script to run a scientometric analysis of journal impact factors. The main focus are ecological journals monitored by Journal Citation Reports (JCR).

The Brazilian Coordination for the Improvement of Higher Education Personnel (CAPES), a major Brazilian funding agency, considers Biodiversity = Ecology + Oceanography + Plant Sciences + Zoology.


## Data source

[Journal Citation Reports](https://jcr.clarivate.com).


## List of folders and files

1. data (folder)

    a. jcr ecology [year].csv -> raw bibliometric data from journals classified in JCR's category Ecology in the respective year (2018, 2019 etc.).
  
    b. jcr oceanography [year].csv -> raw bibliometric data from journals classified in JCR's category Oceanography in the respective year (2018, 2019 etc.).
  
    c. jcr plant sciences [year].csv -> raw bibliometric data from journals classified in JCR's category Plant Sciences in the respective year (2018, 2019 etc.).
  
    d. jcr zoology [year].csv -> raw bibliometric data from journals classified in JCR's category Zoology in the respective year (2018, 2019 etc.).

2. figures (folder)

    a. biodiversity [year].png -> plot with the distribution of impact factors in CAPES's category Biodiversity in the respective year (2018, 2019 etc.).

    b. ecology [year].png -> plot with the distribution of impact factors in JCR's category Ecology in the respective year (2018, 2019 etc.).

2. jc.R -> R script for analyzing the data and plotting the graphs.

3. ImpactFactor.Rmd -> summary of the results in RMarkDown format.

4. ImpactFactor.pdf -> summary of the results in PDF format.


## Instructions

Follow the instructions provided in the script "jc.R". Alternatively, follow the tutorial provided in "ImpactFactor.Rmd".


## Feedback

If you have any questions, suggestions, or corrections, please feel free to open an [issue](https://github.com/marmello77/ImpactFactor/issues) or make a [pull request](https://github.com/marmello77/ImpactFactor/pulls).


## Acknowledgments

We thank our labmates and our sponsors, especially the Alexander von Humboldt-Stiftung, CNPq, CAPES, and FAPESP, who gave us grants, fellowships, and scholarships. Last, but not least, we thank the [Stack Overflow Community](https://stackoverflow.com), where we solve most of our coding dilemmas, like this dilemma related to [raw data importing](https://stackoverflow.com/questions/68230571/how-to-import-a-csv-with-a-last-empty-column-into-r). 
