#!/bin/bash

print_help() {
echo "Usage: quick_download [List of genomes to download]
        -l, --list   Genomes to download, one per line
	-r, --reference Reference genome In Fasta format
	-c, --mincov Maximum coverage
		     Default: 150
	-t, --threads Number of threads
		     Default: 8
        -h, --help      Print this message.
        " >&2 ;
}

not_found(){
	echo "ERROR: $1 is not installed or not included in the path." >&2;
        exit 1

}


# optional arguments for the tool
#OPTS=`getopt -o vhmtp:a:c:n:x:y:w:z:l: --long threads:,help,version,tree,matrix,coverage:,identity:,name:,geneCov1:,geneCov2:,geneIden1:,geneIden2:,geneLen: -n 'parse-options' -- "$@"`
#eval set -- "$OPTS"

set -euo pipefail

# Initialize our own variables:

THREADS=8
LIST=
REFERENCE=
PARAMS=""
MINCOV=150
HELP=false

while [ "$#" -gt 0 ]; do
  case "$1" in
    -l) LIST="$2"; shift 2;;
    -c) COVERAGE="$2"; shift 2;;
    -r) REFERENCE="$2"; shift 2;;
    -h) HELP=true; shift 2;;

    --list=*) LIST="${1#*=}"; shift 1;;
    --mincov=*) COVERAGE="${1#*=}"; shift 1;;
    --reference=*) REFERENCE="${1#*=}"; shift 1;;
    --list|--reference) echo "$1 requires an argument" >&2; exit 1;;
    
    -*) echo "unknown option: $1" >&2; exit 1;;
#die "unrecognized argument: $1"
    *) die "unrecognized argument: $1"; shift 1;;
  esac
done




if $HELP
then
        print_help
	exit 2
fi

if  [ -z "$LIST" ]
then 
	echo "List of SRA accessions not provided, exiting"
	exit 1
else
        echo "List of SRA accessions provided, proceding"

	if [ -z "$REFERENCE" ]
	then
		echo "Reference not provided, exiting"
		exit 1 
	else
		echo "Reference and List provide, proceding!"
	fi
fi


echo "Checking for prerequisite programs"
# checking if the required programs are installed
if ! [ -x "$(command -v Rscript)" ]; then
	not_found R
fi

#if ! [ -x "$(command -v snippy)" ]; then
#	not_found snippy
#fi
echo "All programs needed are installed"
echo "running parallel command"
parallel --link --eta bash ./bin/combined_script.sh {1} {2} :::: $LIST ::: $REFERENCE ::: $THREADS

#echo $PARAMS
