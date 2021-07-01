#fastq-dump --split-3 -X 2000000 ./Data/$1.sra -O ./Data/
snippy --outdir Mapped_genomes/$1 --cpus $3 --ref $2 --R1 ./Data/$1_1.fastq.gz --R2 ./Data/$1_2.fastq.gz
 rm ./Data/$1*
