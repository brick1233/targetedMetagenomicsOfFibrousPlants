#!/bin/bash
#SBATCH -p shared # select partition
#SBATCH -c 64                # CPU allocation, one per thread, up to 128.
#SBATCH --mem=64G            # memory requirments, up to 250G.
#SBATCH --gres=tmp:50G       # $TMPDIR space required on each compute node, up to 400G.
#SBATCH -t 01:00:00     # time limit in format dd-hh:mm:ss
#SBATCH --job-name=S01_installAndConfig_sraToolkit # name the job
#SBATCH --output=../log/S01_installAndConfig_sraToolkitMothur%A_%a.out
#SBATCH --error=../log/S01_installAndConfig_sraToolkitMothur%A_%a.err
#SBATCH --array=1

#change to home dir
cd ~

#check if toolkit exists and construct if not
toolkitDir="sratoolkit.3.2.1-ubuntu64"
if [ ! -d $toolkitDir ]
then
    #download and install toolkit
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.2.1/sratoolkit.3.2.1-ubuntu64.tar.gz
    tar -xvzf sratoolkit.3.2.1-ubuntu64.tar.gz -C ~
    rm sratoolkit.3.2.1-ubuntu64.tar.gz
    echo PATH=~/sratoolkit.3.2.1-ubuntu64/bin:$PATH>>.bashrc
fi

mothDir="mothur"
if [ ! -d $mothDir ]
then
    #download and install toolkit
    wget https://github.com/mothur/mothur/releases/download/v1.48.3/Mothur.linux_8_noReadline.zip
    unzip Mothur.linux_8_noReadline.zip
    mv Mothur.linux_8_noReadline mothur
    rm Mothur.linux_8_noReadline.zip
    rm -rf __MACOSX/
    echo PATH=~/mothur/:$PATH>>.bashrc
fi

source .bashrc
expectedOutput="@SRR390728.1 1 length=72 CATTCTTCACGTAGTTCTCGAGCCTTGGTTTTCAGCGATGGAGAATGACTTTGACAAGCTGAGAGAAGNTNC +SRR390728.1 1 length=72 ;;;;;;;;;;;;;;;;;;;;;;;;;;;9;;665142;;;;;;;;;;;;;;;;;;;;;;;;;;;;;96&&&&( @SRR390728.2 2 length=72 AAGTAGGTCTCGTCTGTGTTTTCTACGAGCTTGTGTTCCAGCTGACCCACTCCCTGGGTGGGGGGACTGGGT +SRR390728.2 2 length=72 ;;;;;;;;;;;;;;;;;4;;;;3;393.1+4&&5&&;;;;;;;;;;;;;;;;;;;;;<9;<;;;;;464262"

testOutput="$(fastq-dump --stdout -X 2 SRR390728)"

if [ $"testOutput" = $"expectedOutput" ]
then
   echo "ERROR: Issue making sratoolkit. See log/output files for more information. Happy debugging!"
fi

echo "S01 finished!"
