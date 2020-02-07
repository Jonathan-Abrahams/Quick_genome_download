#fastq-dump --split-3 -X 2000000 ./Data/$1.sra -O ./Data/
echo $3 >./Mapped_genomes/$1/Ratio_used.txt
snippy --outdir Mapped_genomes/$1 --cpus 1 --ref $2 --R1 ./Data/$1_1.fastq.gz --R2 ./Data/$1_2.fastq.gz
 rm ./Data/$1*
