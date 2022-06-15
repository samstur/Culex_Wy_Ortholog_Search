#!/bin/bash
#SBATCH --job-name=efetch_search --output=z.efetchsearch
#SBATCH --mail-type=END,FAIL --mail-user=<>@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=00:10:00
#SBATCH --mem=1MB

for LOC in $(cat <example_list>)
do
 line="$(efetch -db gene -format fasta -id $LOC | grep "Annotation")"
 chr=$(echo $line|cut -d' ' -f4)
 loc="$(echo $line|cut -d' ' -f5)"
 start="$(echo $loc|cut -d'.' -f1|cut -c 2-)"
 end="$(echo $loc|cut -d'.' -f3|sed 's/.$//')"
 seq=$(samtools faidx GCF_015732765.1_VPISU_Cqui_1.0_pri_paternal_genomic.fna $chr:$start-$end)
 echo $seq
done > <example_list_seq.faa>
