#!/bin/bash
#SBATCH --job-name=blastx_search --output=z.blastx_search
#SBATCH --mail-type=END,FAIL --mail-user=<>@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=01:00:00
#SBATCH --mem=1GB


# load blast
module load blast/2.12.0+

# create protein reference database from albopictus proteome
#makeblastdb -in GCF_006496715.1_Aalbo_primary.1_protein.faa -dbtype prot

#blastx -query example_list_seq \
blastx -query culex_full_genes_list_fasta \
-db GCF_006496715.1_Aalbo_primary.1_protein.faa \
-out culex_ortholog \
-outfmt "6 qseqid sseqid pident evalue bitscore" \
-max_target_seqs 5
