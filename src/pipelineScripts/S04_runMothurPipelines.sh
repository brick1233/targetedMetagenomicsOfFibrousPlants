#!/bin/bash
#SBATCH -p shared # select partition
#SBATCH -c 128               # CPU allocation, one per thread, up to 128.
#SBATCH --mem=125G            # memory requirments, up to 250G.
#SBATCH --gres=tmp:50G       # $TMPDIR space required on each compute node, up to 400G.
#SBATCH -t 24:00:00     # time limit in format dd-hh:mm:ss
#SBATCH --job-name=S04_runMothur # name the job
#SBATCH --output=../log/S04_runMothurSumm%A_%a.out
#SBATCH --error=../log/S04_runMothur%A_%a.err
#SBATCH --array=1

#cd to each output dir and run the final summary
mothur /nobackup/qsfl69/fibrousPlantsRetting/output/mothur/PRJEB20299/PRJEB20299.batch

mothur /nobackup/qsfl69/fibrousPlantsRetting/output/mothur/PRJEB27872/PRJEB27872.batch

mothur /nobackup/qsfl69/fibrousPlantsRetting/output/mothur/PRJNA309354/PRJNA309354.batch

mothur /nobackup/qsfl69/fibrousPlantsRetting/output/mothur/PRJNA494847/PRJNA494847.batch
