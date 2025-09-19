#!/bin/bash
#SBATCH -p shared # select partition
#SBATCH -c 16                # CPU allocation, one per thread, up to 128.
#SBATCH --mem=32G            # memory requirments, up to 250G.
#SBATCH --gres=tmp:50G       # $TMPDIR space required on each compute node, up to 400G.
#SBATCH -t 01:00:00     # time limit in format dd-hh:mm:ss
#SBATCH --job-name=S03_retriveMothurReferenceFiles # name the job
#SBATCH --output=../log/S03_retriveMothurReferenceFiles%A_%a.out
#SBATCH --error=../log/S03_retriveMothurReferenceFiles%A_%a.err
#SBATCH --array=1




#change to data dir and delete the reference if it exists
cd ../../data/

reference="reference"
if [ -d $reference ]
then
    rm -rf $reference
fi

#make the dir, download and extract the files, remove the zipped files, and move the trainset files to their parent dir
mkdir $reference
cd $reference
wget https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v138_2.tgz
wget https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset19_072023.pds.tgz
tar -xvzf trainset19_072023.pds.tgz
tar -xvzf silva.nr_v138_2.tgz


mv trainset19_072023.pds/* ./
rm *.tgz
rm -rf trainset19_072023.pds
