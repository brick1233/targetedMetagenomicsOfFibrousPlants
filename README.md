# Read Me:

#### Overview:

This repo contains the code necessary to perform a meta-analysis of metabarcoding experiments. A paper describing the project, as well as the .rmd file used to create it, is provided in ./writeup. Supplementary material is provided in ./SuppMaterial/SuppFigures and ./SuppMaterial/SuppTables.

#### Usage:

The scripts contained in ./src/pipelineScripts are meant to be submitted to a Slurm job scheduler on a Linux platform. After running S04, you have to use the .rmd file in ./output/mothur/shared/ to convert the mothur data into something to submit to PICRUSt2. Then use the script ./src/pipelineScripts/S05\* and then follow the .rmd files in the ./output/R_anal directory to analyse the mothur and PICRUSt2 data. The literature review data and code is contained in ./litReview.

#### Disclaimer:

This worked locally and on the Hamilton 8 HPC provided by Durham University, but the repo has yet to be fully tested from scratch. For this reason, expect most of the pipeline to run but be prepared to troubleshoot. You may need to install PICRUSt2 in a conda [environment](https://github.com/picrust/picrust2/wiki/Installation). Some docs are better than no docs. Sorry in advance!
