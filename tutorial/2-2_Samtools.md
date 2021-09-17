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



# Setup

Create a new directory from your home directory called “samtools-demo”.
```
cd ~
mkdir samtools-demo
```


Navigate into that directory
```
cd samtools-demo
```

Download the example gzipped SAM file someone have prepared
```

curl https://s3.amazonaws.com/samtools-tutorial/sample.sam.gz > sample.sam.gz
gzip -d sample.sam.gz

# Randomize. You don't need to know details
samtools collate sample.sam -o sample_shuffle.sam
mv sample.sam sample.sam.bak
mv sample_shuffle.sam sample.sam

```

see gzip options
```
$ man gzip

GZIP(1)                   BSD General Commands Manual                  GZIP(1)

NAME
     gzip -- compression/decompression tool using Lempel-Ziv coding (LZ77)

SYNOPSIS
     gzip [-cdfhkLlNnqrtVv] [-S suffix] file [file [...]]
     gunzip [-cfhkLNqrtVv] [-S suffix] file [file [...]]
     zcat [-fhV] file [file [...]]

DESCRIPTION
     The gzip program compresses and decompresses files using Lempel-Ziv coding (LZ77).  If no files are specified, gzip will compress
     from standard input, or decompress to standard output.  When in compression mode, each file will be replaced with another file
     with the suffix, set by the -S suffix option, added, if possible.

     In decompression mode, each file will be checked for existence, as will the file with the suffix added.  Each file argument must
     contain a separate complete archive; when multiple files are indicated, each is decompressed in turn.

     In the case of gzcat the resulting data is then concatenated in the manner of cat(1).

     If invoked as gunzip then the -d option is enabled.  If invoked as zcat or gzcat then both the -c and -d options are enabled.

     This version of gzip is also capable of decompressing files compressed using compress(1), bzip2(1), or xz(1).

OPTIONS
     The following options are available:

     -1, --fast

     -2, -3, -4, -5, -6, -7, -8

     -9, --best        These options change the compression level used, with the -1 option being the fastest, with less compression,
                       and the -9 option being the slowest, with optimal compression.  The default compression level is 6.

     -c, --stdout, --to-stdout
                       This option specifies that output will go to the standard output stream, leaving files intact.

     -d, --decompress, --uncompress
                       This option selects decompression rather than compression.

     -f, --force       This option turns on force mode.  This allows files with multiple links, symbolic links to regular files, over-
                       writing of pre-existing files, reading from or writing to a terminal, and when combined with the -c option,
                       allowing non-compressed data to pass through unchanged.

     -h, --help        This option prints a usage summary and exits.

     -k, --keep        Keep (do not delete) input files during compression or decompression.

     -L, --license     This option prints gzip license.
```

See which file is here.
```
ls -alh
```

ls options
```
LS(1)                     BSD General Commands Manual                    LS(1)

NAME
     ls -- list directory contents

SYNOPSIS
     ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]

DESCRIPTION
     For each operand that names a file of a type other than directory, ls displays its name as well as any requested, associated
     information.  For each operand that names a file of type directory, ls displays the names of files contained within that direc-
     tory, as well as any requested, associated information.

     If no operands are given, the contents of the current directory are displayed.  If more than one operand is given, non-directory
     operands are displayed first; directory and non-directory operands are sorted separately and in lexicographical order.

     The following options are available:

     -@      Display extended attribute keys and sizes in long (-l) output.

     -1      (The numeric digit ``one''.)  Force output to be one entry per line.  This is the default when output is not to a termi-
             nal.

     -A      List all entries except for . and ...  Always set for the super-user.

     -a      Include directory entries whose names begin with a dot (.).

     -B      Force printing of non-printable characters (as defined by ctype(3) and current locale settings) in file names as \xxx,
             where xxx is the numeric value of the character in octal.

     -b      As -B, but use C escape codes whenever possible.

     -C      Force multi-column output; this is the default when output is to a terminal.

     -c      Use time when file status was last changed for sorting (-t) or long printing (-l).

     -d      Directories are listed as plain files (not searched recursively).

     -e      Print the Access Control List (ACL) associated with the file, if present, in long (-l) output.

     -F      Display a slash (`/') immediately after each pathname that is a directory, an asterisk (`*') after each that is exe-
             cutable, an at sign (`@') after each symbolic link, an equals sign (`=') after each socket, a percent sign (`%') after
             each whiteout, and a vertical bar (`|') after each that is a FIFO.

     -f      Output is not sorted.  This option turns on the -a option.

     -G      Enable colorized output.  This option is equivalent to defining CLICOLOR in the environment.  (See below.)

     -g      This option is only available for compatibility with POSIX; it is used to display the group name in the long (-l) format
     
     -h      When used with the -l option, use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to
             reduce the number of digits to three or less using base 2 for sizes.
             
     -l      (The lowercase letter ``ell''.)  List in long format.  (See below.)  If the output is to a terminal, a total sum for all
             the file sizes is output on a line before the long listing.     
```



## Samtools help

To bring up the help, just type

```
samtools
```

As you can see, there are multiple "subcommands" and for samtools to work you must tell it which subcommand you want to use.

Examples:

```
samtools view
samtools sort
samtools depth
```





# Converting SAM to BAM with samtools “view”



A BAM file is just a SAM file but stored in binary; you should always convert your SAM files into BAM to save storage space and BAM files are faster to manipulate.

To get started, view the first couple of lines of your SAM file by typing on the terminal:

```shell
$ head sample.sam
```

To see more lines

```
# See the first 20 lines
head -n 20 sample.sam

# See the first 50 lines
head -n 50 sample.sam

```

Another way to see lines

```

more sample.sam

```

Then enter `space key` to see next lines. enter `space key` again to see next lines.

You can escape by typing `q`



To convert SAM to BAM, we use the `samtools view` command. 

We must specify that our input is in SAM format (by default it expects BAM) using the -S option. 

We must also say that we want the output to be BAM (by default it produces BAM) with the -b option. 

Samtools follows the UNIX convention of sending its output to the UNIX STDOUT, so we need to use a redirect operator (“>”) to create a BAM file from the output.

```shell

$ samtools
$ samtools view -S -b sample.sam > sample.bam

```
Now, we can use the samtools view command to convert the BAM to SAM so we can read it.

```
samtools view sample.bam | head
```



# samtools “sort”

When you align FASTQ files with all current sequence aligners, the alignments produced are in random order with respect to their position in the reference genome. In other words, the BAM file is in the order that the sequences occurred in the input FASTQ files.

```
samtools view sample.bam | head
```

Doing anything meaningful such as calling variants or visualizing alignments in IGV) requires that the BAM is further manipulated. It must be sorted such that the alignments occur in “genome order”. That is, ordered positionally based upon their alignment coordinates on each chromosome.

```

samtools sort sample.bam -o sample.sorted.bam

```

Now let’s check the order:

```
samtools view sample.sorted.bam | head
```



**Q)** Notice anything different about the coordinates of the alignments?



## Converting SAM directly to a sorted BAM file

Like many Unix tools, SAMTools is able to read directly from a stream i.e. stdout.

```shell
samtools view -S -b sample.sam | samtools sort - -o sample.sorted2.bam
```
Let's compare `sample.sorted.bam` and `sample.sorted2.bam`

```
samtools view sample.sorted.bam | head -n 5

samtools view sample.sorted2.bam | head -n 5
```



# samtools "index"

Indexing a genome sorted BAM file allows one to quickly extract alignments overlapping particular genomic regions. Moreover, indexing is required by genome viewers such as IGV so that the viewers can quickly display alignments in each genomic region to which you navigate.

A BAM index file is usually needed when visualising a BAM file.

```shell
samtools index sample.sorted.bam sample.sorted.bai
```

This will create a bam "index" file.

```
ls
```

Now, let’s exploit the index to extract alignments from the 33rd megabase of chromosome 1. To do this, we use the samtools `view` command, which we will give proper treatment in the next section. For now, just do it without understanding. No really. Do it.

```
samtools view sample.sorted.bam 1:861000-862000
```



**Q)** How many alignments are there in this region?

```
samtools view sample.sorted.bam 1:861000-862000 | wc -l
```

## Use IGV to view BAMs

Install igv from

https://software.broadinstitute.org/software/igv/download

You had better to install igv with Java included.



Open igv, then upload `sample.sorted.bam`, then let's see the following region. 

```

chr1:861,160-861,710

```

**Q)** what do you see?



![image-20210908131704101](/Users/hoonkim/Library/Application Support/typora-user-images/image-20210908131704101.png)



# samtools “view”

The samtools `view` command is the most versatile tool in the samtools package. It’s main function, not surprisingly, is to allow you to convert the binary (i.e., easy for the computer to read and process) alignments in the BAM file view to text-based SAM alignments that are easy for *humans* to read and process.

## Scrutinize some alignments

Let us start by inspecting the first five alignments in our BAM in detail.

```
samtools view sample.sorted.bam | head -n 5
```



## Count the total number of alignments.

```
samtools view sample.sorted.bam | wc -l
```



## Inspect the header.

The “header” in a BAM file records important information regarding the reference genome to which the reads were aligned, as well as other information about how the BAM has been processed. One can ask the `view` command to report solely the header by using the `-H` option.

```
samtools view -H sample.sorted.bam
```



## Capture the FLAG.

The FLAG field in the BAM format encodes several key pieces of information regarding how an alignment aligned to the reference genome. We can exploit this information to isolate specific types of alignments that we want to use in our analysis.

For example, we often want to call variants solely from paired-end sequences that aligned “properly” to the reference genome. Why?



**flags**

visit http://www.htslib.org/doc/samtools-flags.html

```
NAME
samtools flags – convert between textual and numeric flag representation.
SYNOPSIS
samtools flags FLAGS...

DESCRIPTION
Convert between textual and numeric flag representation.

Each FLAGS argument may be either an integer (in decimal, hexadecimal, or octal) representing a combination of the listed numeric flag values, or a comma-separated string NAME,...,NAME representing a combination of the flag names listed below.

FLAGS:

0x1	PAIRED	paired-end (or multiple-segment) sequencing technology
0x2	PROPER_PAIR	each segment properly aligned according to the aligner
0x4	UNMAP	segment unmapped
0x8	MUNMAP	next segment in the template unmapped
0x10	REVERSE	SEQ is reverse complemented
0x20	MREVERSE	SEQ of the next segment in the template is reverse complemented
0x40	READ1	the first segment in the template
0x80	READ2	the last segment in the template
0x100	SECONDARY	secondary alignment
0x200	QCFAIL	not passing quality controls
0x400	DUP	PCR or optical duplicate
0x800	SUPPLEMENTARY	supplementary alignment
```



**0x2	PROPER_PAIR	each segment properly aligned according to the aligner**



To ask the `view` command to report solely “proper pairs” we use the `-f` option and ask for alignments where the second bit is true (proper pair is true).

```
samtools view -f 0x2 sample.sorted.bam
```



How many *properly* paired alignments are there?

```
samtools view -f 0x2 sample.sorted.bam | wc -l
```



Now, let’s ask for alignments that are NOT properly paired. To do this, we use the `-F` option (note the capitalization to denote “opposite”).

```
samtools view -F 0x2 sample.sorted.bam
```



How many *improperly* paired alignments are there?

```
samtools view -F 0x2 sample.sorted.bam | wc -l
```



Does everything add up?



## Filtering out unmapped reads in BAM

**0x4	UNMAP	segment unmapped**

```shell
samtools view -F 0x4 sample.sorted.bam | more
```



## Extracting only the first read of pairs from a paired end BAM

**0x40	READ1	the first segment in the template**

Sometimes you only want the first pair of a mate

```shell
$ samtools view -h -f 0x0040 sample.sorted.bam | more
```





## Converting BAM to SAM

***Note: remember to use -h to ensure the converted SAM file contains the header information. Generally, I recommend storing only sorted BAM files as they use much less disk space and are faster to process.***

```shell
samtools view -h sample.sorted.bam > sample.sorted.sam
```



## Extracting SAM entries mapping to a specific loci

If we want all reads mapping within the genomic coordinates `1:33000000-34000000`

```shell
samtools view sample.sorted.bam 1:33000000-34000000

samtools view -b sample.sorted.bam 1:33000000-34000000 > sample.sorted.small.bam
samtools index sample.sorted.small.bam sample.sorted.small.bai

```



## Simple stats using SAMTools flagstat

The flagstat command provides simple statistics on a BAM file.

Then simply:
```shell
samtools flagstat sample.sorted.bam
```
The output is:

```
5026086 + 0 in total (QC-passed reads + QC-failed reads)
5022530 + 0 primary
0 + 0 secondary
3556 + 0 supplementary
456091 + 0 duplicates
456014 + 0 primary duplicates
5022088 + 0 mapped (99.92% : N/A)
5018532 + 0 primary mapped (99.92% : N/A)
5022530 + 0 paired in sequencing
2511265 + 0 read1
2511265 + 0 read2
5000952 + 0 properly paired (99.57% : N/A)
5014534 + 0 with itself and mate mapped
3998 + 0 singletons (0.08% : N/A)
4392 + 0 with mate mapped to a different chr
2765 + 0 with mate mapped to a different chr (mapQ>=5)
```



To confirm some of the numbers returned by flagstat:

```shell
samtools view sample.sorted.bam | wc -l
? #same as line 1

samtools view -f 0x100 sample.sorted.bam | wc -l
? #same as line 3

samtools view -f 0x800 sample.sorted.bam | wc -l
? #same as line 4

samtools view -f 0x400 sample.sorted.bam | wc -l
? #same as line 5
```


## SAMTools calmd/fillmd (SKIP)

The calmd or fillmd tool is useful for visualising mismatches and insertions in an alignment of a read to a reference genome. For example:

```shell
samtools view -F 0x2 sample.sorted.bam | head -n 1

HWI-ST354R:351:C0UPMACXX:5:1102:7420:32550	97	1	909827	60	100M	2	33141297	0	CGGTCCCCCAGGAGGAGCCGGGACCCCGGCTACGACCACCTCTGGGACGAGACTTTGTCTTCCTCCCACCAGAAGTGCCCCCAGCTTGGAGGGCCTGAGG	CCCFFFFFHHHHHJJJJJJJJJJJJJJJJJJJJJJJHHHFFFFEEEEDDDDDDDDDDDDDDDDDDDDDDDDBDDCDCCDDDDDDDCCDDDDDDDBDDCD8	MC:Z:7S12M2I32M47S	MD:Z:100	RG:Z:1719PC0017_51	NM:i:0	MQ:i:45	AS:i:100	XS:i:19

```

```
#the -e changes identical bases between the read and reference into ='s
samtools view -F 0x2 sample.sorted.bam | head -n 1 | samtools fillmd -e - PATH_TO_human_g1k_v37_decoy.fasta

```


## Random subsampling of BAM file

The SAMTools view -s parameter allows you to randomly sample lines of a BAM file
```

samtools view -s 0.5 sample.sorted.bam | head -n 5

```
*Note that this will subsample half of the reads that mapped.*



## Fastest way to count number of reads

```shell
#number of reads
samtools idxstats sample.sorted.bam | awk '{s+=$3+$4} END {print s}'

#number of mapped reads
samtools idxstats sample.sorted.bam | awk '{s+=$3} END {print s}'

```

