Rscript ./bin/ENA_download.R $1
#bash ./bin/sra_get.sh $1
bash ./bin/sra_to_bam_min.sh $1 $2 $3
