#!/bin/bash
#SBATCH --job-name=gff_parse --output=z.gff_parse
#SBATCH --mail-type=END,FAIL --mail-user=<>@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=00:30:00
#SBATCH --mem=4GB

module load samtools/1.9

for LOC in $(cat culex_full_genes_list)
do
 chr="$(awk '$3 == "gene"' GCF_015732765.1_VPISU_Cqui_1.0_pri_paternal_genomic.gff|grep "$LOC"| cut -f1)"
 start="$(awk '$3 == "gene"' GCF_015732765.1_VPISU_Cqui_1.0_pri_paternal_genomic.gff|grep "$LOC"| cut -f4)"
 end="$(awk '$3 == "gene"' GCF_015732765.1_VPISU_Cqui_1.0_pri_paternal_genomic.gff|grep "$LOC"| cut -f5)"
 seq=$(samtools faidx GCF_015732765.1_VPISU_Cqui_1.0_pri_paternal_genomic.fna $chr:$start-$end|sed 's/>//')
 echo ">${LOC} ${seq}"
done>culex_full_genes_list_fasta
