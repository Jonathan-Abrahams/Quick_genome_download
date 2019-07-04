#ena get
args = commandArgs(trailingOnly=TRUE)
#args[1]="SRR9123503"

#If the run accession has seven digits then the <dir2> is 00 + the last digit of the run accession. 
#For example, fastq files for run SRR1016916 are in directory: ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR101/006/SRR1016916/.

#aim ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR912/003/SRR9123503/SRR9123503_1.fastq.gz

#First 6

First_6=substr(args[1],1,6)
lenny=nchar(args[1])
Last_1_modified=paste("00",substr(args[1],lenny,lenny),sep="")

full_url_1=paste("ftp://ftp.sra.ebi.ac.uk/vol1/fastq",First_6,Last_1_modified,args[1],paste(args[1],"_1.fastq.gz",sep=""),sep="/")
full_url_2=paste("ftp://ftp.sra.ebi.ac.uk/vol1/fastq",First_6,Last_1_modified,args[1],paste(args[1],"_2.fastq.gz",sep=""),sep="/")
print(paste("First call: ","wget",full_url_1,"-P","./Data/"))
print(paste("First call: ","wget",full_url_2,"-P","./Data/"))

system(paste("wget",full_url_1,"-P","./Data/"))

system(paste("wget",full_url_2,"-P","./Data/"))