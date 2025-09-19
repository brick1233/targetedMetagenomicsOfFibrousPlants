#!/bin/bash
#SBATCH -p shared # select partition
#SBATCH -c 16                # CPU allocation, one per thread, up to 128.
#SBATCH --mem=32G            # memory requirments, up to 250G.
#SBATCH --gres=tmp:150G       # $TMPDIR space required on each compute node, up to 400G.
#SBATCH -t 01:00:00     # time limit in format dd-hh:mm:ss
#SBATCH --job-name=S02_downloadFastq # name the job
#SBATCH --output=../log/S02_downloadFastq%A_%a.out
#SBATCH --error=../log/S02_downloadFastq%A_%a.err
#SBATCH --array=1

#directory containing accession IDs for each experiment
accIDs=../../data/accessionIDs

#for each experimental accession, fasterq-dump the needed files to a respective data folder
for accFile in "$accIDs"/*
do
  #extract the base name from the file and make the data folder
  accID=$(basename "$accFile" .txt)
  mkdir "../../data/fastqFiles/$accID"
  outDir="../../data/fastqFiles/$accID"

  # Loop through each line in the file and dump the fastq files to the proper dir
  while IFS= read -r line || [ -n "$line" ]; do
      echo "Running fasterq-dump on: $line"
      prefetch "$line" -O "$outDir"
      fasterq-dump "$line" -O "$outDir"
  done < "$accFile"

  # check if the number of downloaded files is expected and report error if needed
  expectedFileCount=$(( $(wc -l < "$accFile") * 2 ))
  actualFileCount=$(find "$outDir" -type f -name "*.fastq" | wc -l)

  if [ "$actualFileCount" -ne "$expectedFileCount" ]; then
    echo "ERROR: Not all the fastq files were downloaded for this accession $accID. Check the .err file for S02*.sh. If these are not paired reads ie) MiSeq data then this error can be ignored."
  fi
done
