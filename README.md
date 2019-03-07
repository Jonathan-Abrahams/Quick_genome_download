# Quick_genome_download


 This repository is a fast way of downloading and assembling genomes from the SRA. A tentative estimate of its speed is that it can download and map 200 microbial genomes per 24 hours per 8 cores.

Requirements:

install SRAtoolkit and Snippy:

```
brew install sratoolkit
brew install brewsci/bio/snippy
```

Create a file with 1 run per line:

```

ERR551085
ERR551223
ERR552204
ERR551150
ERR553349
ERR552113
ERR552505
ERR552942
ERR552440

```

Run the command(needs to be renamed)

```
 bash bin/xargs_script.sh AMR_TB_GENOMES ./Reference/GCF_000195955.2_ASM19595v2_genomic.fna
```
