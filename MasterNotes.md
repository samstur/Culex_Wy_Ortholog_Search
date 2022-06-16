# Workflow/pipeline details for the Culex, Wyeomyia, Aedes albopictus putative ortholog search

## FASTA Sequence Search
First, I took the list of putative orthologs between DEG sets from Culex and Wyeomyia and got a list of the 172 Culex LOCIDs. List can be found [here](https://github.com/samstur/Culex_Wy_Ortholog_Search/blob/main/Combined_Wyeomyia_Culex_DEGs.csv)
Then I ran this list of LOCIDs through a script to pull out their sequences. I came up with two slightly different scripts to do this:
1) A script called [gff_parse.sh](https://github.com/samstur/Culex_Wy_Ortholog_Search/blob/main/gff_parse.sh) which uses the culex annotation file to look up the chromosome, start, and end location of each LOCID, then uses samtools to find that sequence in the culex genome file.
2) A script called [efetch.sh](https://github.com/samstur/Culex_Wy_Ortholog_Search/blob/main/efetch.sh) which does the same thing as the first script but instead of using the annotation file locally, it creates a query with efetch to get the LOCID location information.

Second, I used blastx to blast my fasta-style list of nucleotide sequences against the albopictus proteome to identify putative orthologs. The script can be found [here](https://github.com/samstur/Culex_Wy_Ortholog_Search/blob/main/blastx_search.sh)
