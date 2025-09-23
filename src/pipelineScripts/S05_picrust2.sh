#!/bin/bash
#SBATCH -p shared # select partition
#SBATCH -c 128               # CPU allocation
#SBATCH --mem=64G            # memory requirment
#SBATCH --gres=tmp:50G       # $TMPDIR space
#SBATCH -t 24:00:00     # time limit in format dd-hh:mm:ss
#SBATCH --job-name=S06_runPICRUST2 # name the job
#SBATCH --output=../log/S06_runPICRUST2%A_%a.out
#SBATCH --error=../log/S06_runPICRUST2%A_%a.err
#SBATCH --array=1

#activate picrust env
source $(conda info --base)/etc/profile.d/conda.sh
conda activate picrust2


#move to shared folder 
cd /nobackup/qsfl69/fibrousPlantsRetting/output/mothur/shared

#OTUs and ASVs at 0.05% relative abundance

#picrust2_pipeline.py -s PRJEB20299.OTUs.fasta -i PRJEB20299.biom -o ../../picrust2/PRJEB20299_OTUs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJEB27872.OTUs.fasta -i PRJEB27872.biom -o ../../picrust2/PRJEB27872_OTUs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJNA309354.OTUs.fasta -i PRJNA309354.biom -o ../../picrust2/PRJNA309354_OTUs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJNA494847.OTUs.fasta -i PRJNA494847.biom -o ../../picrust2/PRJNA494847_OTUs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJEB20299.ASVs.fasta -i PRJEB20299.ASV.biom -o ../../picrust2/PRJEB20299_ASVs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJEB27872.ASVs.fasta -i PRJEB27872.ASV.biom -o ../../picrust2/PRJEB27872_ASVs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJNA309354.ASVs.fasta -i PRJNA309354.ASV.biom -o ../../picrust2/PRJNA309354_ASVs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#picrust2_pipeline.py -s PRJNA494847.ASVs.fasta -i PRJNA494847.ASV.biom -o ../../picrust2/PRJNA494847_ASVs_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#OTUs and ASVs at 0.0005% relative abundance

picrust2_pipeline.py -s PRJEB20299.OTUs.0005.fasta -i PRJEB20299.OTU.0005.biom -o ../../picrust2/PRJEB20299_OTUs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

picrust2_pipeline.py -s PRJEB27872.OTUs.0005.fasta -i PRJEB27872.OTU.0005.biom -o ../../picrust2/PRJEB27872_OTUs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

picrust2_pipeline.py -s PRJNA309354.OTUs.0005.fasta -i PRJNA309354.OTU.0005.biom -o ../../picrust2/PRJNA309354_OTUs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

picrust2_pipeline.py -s PRJNA494847.OTUs.0005.fasta -i PRJNA494847.OTU.0005.biom -o ../../picrust2/PRJNA494847_OTUs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

#run picrust on each experiment (ASVs)
picrust2_pipeline.py -s PRJEB20299.ASVs.0005.fasta -i PRJEB20299.ASV.0005.biom -o ../../picrust2/PRJEB20299_ASVs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

picrust2_pipeline.py -s PRJEB27872.ASVs.0005.fasta -i PRJEB27872.ASV.0005.biom -o ../../picrust2/PRJEB27872_ASVs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

picrust2_pipeline.py -s PRJNA309354.ASVs.0005.fasta -i PRJNA309354.ASV.0005.biom -o ../../picrust2/PRJNA309354_ASVs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128

picrust2_pipeline.py -s PRJNA494847.ASVs.0005.fasta -i PRJNA494847.ASV.0005.biom -o ../../picrust2/PRJNA494847_ASVs_0005_picrust2 --stratified --verbose --in_traits EC,KO,CAZY -p 128



conda deactivate
