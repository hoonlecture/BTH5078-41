# introduction to Samtools

## What is Samtools?
Samtools provides various tools for manipulating alignments in the SAM/BAM format. The SAM (Sequence Alignment/Map) format (BAM is just the binary form of SAM) is currently the de facto standard for storing large nucleotide sequence alignments. If you are dealing with high-throughput sequencing data, at some point you will probably have to deal with SAM/BAM files, so familiarise yourself with them!

## Basic usage

```
samtools <command> [options]
```

If you run samtools on the terminal without any parameters, all the available utilities are listed:

Program: samtools (Tools for alignments in the SAM format)
Version: 1.3.0 
```shell
Samtools
Usage:   samtools <command> [options]

Command: view        SAM<->BAM conversion
         sort        sort alignment file
         mpileup     multi-way pileup
         depth       compute the depth
         faidx       index/extract FASTA
         tview       text alignment viewer
         index       index alignment
         idxstats    BAM index stats (r595 or later)
         fixmate     fix mate information
         flagstat    simple stats
         calmd       recalculate MD/NM tags and '=' bases
         merge       merge sorted alignments
         rmdup       remove PCR duplicates
         reheader    replace BAM header
         cat         concatenate BAMs
         targetcut   cut fosmid regions (for fosmid pool only)
         phase       phase heterozygotes
```

Most of the times I just use view, sort, index and flagstats.

## Converting a SAM file to a BAM file

A BAM file is just a SAM file but stored in binary; you should always convert your SAM files into BAM to save storage space and BAM files are faster to manipulate.

To get started, view the first couple of lines of your SAM file by typing on the terminal:

```shell
$ head test.sam
```

The first 10 lines on your terminal after typing "head test.sam", should be lines starting with the "@" sign, which is an indicator for a header line. If you don't see lines starting with the "@" sign, the header information is most likely missing.

If the header is absent from the SAM file use the command below, where reference.fa is the reference fasta file used to map the reads:
```shell
$ samtools
$ samtools view -bT reference.fa test.sam > test.bam
```
If the header information is available:
```shell
$ samtools view -bS test.sam > test.bam
```
## Sorting a BAM file

Always sort your BAM files; many downstream programs only take sorted BAM files.

```shell
$ samtools sort test.bam test_sorted
```

## Converting SAM directly to a sorted BAM file

Like many Unix tools, SAMTools is able to read directly from a stream i.e. stdout.

```shell
$ samtools view -bS file.sam | samtools sort - file_sorted
```
## Creating a BAM index file

A BAM index file is usually needed when visualising a BAM file.

```shell
$ samtools index test_sorted.bam test_sorted.bai
```

## Converting a BAM file to a SAM file

***Note: remember to use -h to ensure the converted SAM file contains the header information. Generally, I recommend storing only sorted BAM files as they use much less disk space and are faster to process.***

```shell
$ samtools view -h NA06984.chrom16.ILLUMINA.bwa.CEU.low_coverage.20100517.bam > NA06984.chrom16.ILLUMINA.bwa.CEU.low_coverage.20100517.sam
```

## Filtering out unmapped reads in BAM files
```shell
$ samtools view -h -F 4 blah.bam > blah_only_mapped.sam
```
or
```shell
$ samtools view -h -F 4 -b blah.bam > blah_only_mapped.bam
```

## Extracting SAM entries mapping to a specific loci

If we want all reads mapping within the genomic coordinates chr1:200000-500000:

```shell
#index the bam file first
$ samtools index test.bam
$ samtools view test.bam chr1:200000-500000
#all reads mapping on chr1 as another bam
$ samtools view -b test.bam chr1 > test_chr1.bam
```

## Extracting only the first read from paired end BAM files

Sometimes you only want the first pair of a mate

```shell
$ samtools view -h -f 0x0040 test.bam > test_first_pair.sam
```


0x0040 is hexadecimal for 64 (i.e. 16 * 4), which is binary for 1000000, corresponding to the read in the first read pair.

## Simple stats using SAMTools flagstat

The flagstat command provides simple statistics on a BAM file. Here I downloaded a BAM file from the 1000 genome project: ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data/NA06984/alignment/NA06984.chrom20.ILLUMINA.bwa.CEU.low_coverage.20111114.bam

Then simply:
```shell
$ samtools flagstat NA06984.chrom20.ILLUMINA.bwa.CEU.low_coverage.20111114.bam
```
|     |                                                              |
|-----|--------------------------------------------------------------|
|1    | 	6874858 + 0 in total (QC-passed reads + QC-failed reads)    |
|2    |  90281 + 0 duplicates                                        |
|3    |  6683299 + 0 mapped (97.21%)                                 |
|4    |  6816083 + 0 paired in sequencing                            |
|5    |  3408650 + 0 read1                                           |
|6    |  3407433 + 0 read2                                           | 
|7    |  6348470 + 0 properly paired (93.14No value assigned)        |
|8    |  6432965 + 0 with itself and mate mapped                     |
|9    |  191559 + 0 singletons (2.81No value assigned)               |
|10   | 	57057 + 0 with mate mapped to a different chr               |
|11   | 	45762 + 0 with mate mapped to a different chr (mapQ>=5)     |

To confirm some of the numbers returned by flagstat:

```shell
$ samtools view NA06984.chrom20.ILLUMINA.bwa.CEU.low_coverage.20111114.bam | wc
6874858 #same as line 1

$ samtools view -F 4 NA06984.chrom20.ILLUMINA.bwa.CEU.low_coverage.20111114.bam | wc
6683299 #same as line 3

$ samtools view -f 0x0040 NA06984.chrom20.ILLUMINA.bwa.CEU.low_coverage.20111114.bam | wc
3408650 #same as line 5

$ samtools view -f 0x0080 NA06984.chrom20.ILLUMINA.bwa.CEU.low_coverage.20111114.bam | wc
3407433 #same as line 6
```
Here's an example of a properly paired read:
```
SRR035024.17204235 163 20 60126 60 68M8S = 60466 383 CCACCATGGACCTCTGGGATCCTAGCTTTAAGAGATCCCATCACCCACATGAACGTTTGAATTGACAGGGGGAGCG @FEBBABEEDDGIGJIIIHIHJKHIIKAEHKEHEHI>JIJBDJHIJJ5CIFH4;;9=CDB8F8F>5B######### X0:i:1 X1:i:0 XC:i:68 MD:Z:68 RG:Z:SRR035024 AM:i:37 NM:i:0 SM:i:37 MQ:i:60 XT:A:U BQ:Z:BH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
SRR035024.17204235 83 20 60466 60 32S44M = 60126 -383 GGCCTCCCCCCGGGCCCCTCTTGTGTGCACACAGCACAGCCTCTACTGCTACACCTGAGTACTTTGCCAGTGGCCT #################################>D:LIJEJBJIFJJJJIHKIJJJIKHIHIKJJIJJKGIIFEDB X0:i:1 X1:i:0 XC:i:44 MD:Z:44 RG:Z:SRR035024 AM:i:37 NM:i:0 SM:i:37 MQ:i:60 XT:A:U BQ:Z:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
```
For more statistics of SAM/BAM files see the `SAMStat` program.

See the section "Interpreting the BAM flags" below for more information on BAM flags.

## Interpreting the BAM flags

The second column in a SAM/BAM file is the flag column. They may seem confusing at first but the encoding allows details about a read to be stored by just using a few digits. The trick is to convert the numerical digit into binary, and then use the table to interpret the binary numbers, where 1 = true and 0 = false.


**About bam flag**: http://davetang.org/muse/2014/03/06/understanding-bam-flags/, which also includes a Perl script for interpreting BAM flags.

## SAMTools calmd/fillmd

The calmd or fillmd tool is useful for visualising mismatches and insertions in an alignment of a read to a reference genome. For example:

```shell
#random BAM file mapped with BWA
$ samtools view blah.bam

blah        0       chr1    948827  37      1M2D17M1I8M     *       0       0       GGTGTGTGCCTCAGGCTTAATAATAGG     ggcgde`a`egfbfgghdfa_cfea^_  XT:A:U  NM:i:3  X0:i:1  X1:i:0  XM:i:1  XO:i:1  XG:i:1  MD:Z:1^AC25
```

```
#the -e changes identical bases between the read and reference into ='s
$ samtools view -b blah.bam | samtools fillmd -e - ref.fa

blah        0       chr1    948827  37      1M2D17M1I8M     *       0       0       ==================A========     ggcgde`a`egfbfgghdfa_cfea^_  XT:A:U  NM:i:3  X0:i:1  X1:i:0  XM:i:1  XO:i:1  XG:i:1  MD:Z:1^AC25
```
The original read sequence is:
```
blah     G--GTGTGTGCCTCAGGCTTAATAATAGG
         |  |||||||||||||||||| |||||||
genome   GACGTGTGTGCCTCAGGCTTA-TAATAGG
```
The CIGAR string (1M2D17M1I8M) is shown with respect to the read, i.e. a deletion means a deletion in the read and an insertion is an insertion in the read, as you can see above. SAMTools fillmd shows the insertions (as above) and mismatches (not in the example above) but not deletions.

## Creating FASTQ files from a BAM file

For example to extract ONLY unaligned from a bam file:

```shell
bam2fastq -o blah_unaligned.fastq --no-aligned blah.bam
```

To extract ONLY aligned reads from a bam file:

```shell
bam2fastq -o blah_aligned.fastq --no-unaligned blah.bam
```

## Random subsampling of BAM file

The SAMTools view -s parameter allows you to randomly sample lines of a BAM file
```
$ samtools view -s 0.5 -b file.bam > random_half_of_file.bam
```
*Note that this will subsample half of the reads that mapped.*

## Fastest way to count number of reads

From http://left.subtree.org/2012/04/13/counting-the-number-of-reads-in-a-bam-file/#comment-403

```shell
#number of reads
$ samtools idxstats in.bam | awk '{s+=$3+$4} END {print s}'
#number of mapped reads
$ samtools idxstats in.bam | awk '{s+=$3} END {print s}'
```

## Obtaining genomic sequence
```shell
# some test fasta
$ cat test.fa 
>chr1
AAAAAAAAAA
CCCCCCCCCC
GGGGGGGGGG
TTTTTTTTTT

# index fasta file
$ samtools faidx test.fa

# obtain sequence
$ samtools faidx test.fa chr1:10-11
>chr1:10-11
AC

# note the 1-based start
$ samtools faidx test.fa chr1:20-31
>chr1:20-31
CGGGGGGGGGGT
```

**More information**

http://samtools.sourceforge.net/

http://htslib.org/doc/samtools.html
