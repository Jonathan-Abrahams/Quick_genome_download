# /sra/sra-instant/reads/ByRun/sra/{SRR|ERR|DRR}/<first 6 characters of accession>/<accession>/<accession>.sra
genome=$(echo "$1")
echo $genome
first_3=$(echo "$1"|cut -c1-3)
first_6=$(echo "$1"|cut -c1-6)

echo $first_3

echo $first_6

URL_TING="ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/$first_3/$first_6/$1/$1.sra"

wget $URL_TING -O ./Data/$1.sra
