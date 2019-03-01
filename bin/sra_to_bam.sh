fastq-dump --split-3 ./Data/$1.sra -O ./Data/
snippy --outdir Mapped_genomes/$1 --cpus 1 --ref ./Reference/GCF_000009065.1_ASM906v1_genomic.fna --R1 ./Data/$1_1.fastq --R2 ./Data/$1_2.fastq
 rm ./Data/$1*
