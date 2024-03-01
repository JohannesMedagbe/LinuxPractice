# LinuxPractice

# Creation of Exercise directory 
mkdir Exercise

# Setting working directory
mkdir -p data scripts outputs and in data run mkdir raw processed
# Copying datasets to raw data 
mv nrf1_seq.fa nrf1_seqtemp.fa Exercise/data/raw

# Extracting headers and saving in file sequence_names.txt after navigating to raw directory 
grep "^>" *.fa >> ../processed/sequence_names.txt
cut -d ':', f 2 sequence-names.txt > sequence_names2.txt

# Saving command used for headers extraction in file extract_seq.sh
touch extract_seq.sh
open extract_seq.sh
## paste and save

# Counting and saving to files
touch count_mRNA.txt
grep "mRNA" sequence_names2.txt >> count_mRNA.txt
touch other_categ.txt
grep -v "mRNA" sequence_names2.txt | grep "sequence"
touch num_other_categ.txt
grep -v "mRNA" sequence_names.txt | grep "full insert sequence" | wc -l >> num_other_categ.txt
grep -v "mRNA" sequence_names.txt | grep "complete sequence" | wc -l >> num_other_categ.txt
rep -v "mRNA" sequence_names.txt | grep "weird sequence" | wc -l >> num_other_categ.txt

# Counting organisms and removing duplicates
cut -d ',' -f 1 sequence_names2.txt | cut -d ':' -f 2 | cut -d '.' -f 2 | sort | uniq | wc -l
ut -d ',' -f 1 sequence_names2.txt | cut -d ':' -f 2 | cut -d '.' -f 2 | sort | uniq > organisms.txt

# Counting predicted
grep -i "predicted" sequence_names2.txt | wc -l

# Counting nucleotides
grep -rv '^>' raw > processed/actual_sequences.txt
cut -d ':' -f 2-5 processed/actual_sequences.txt > processed/actual_sequences2.txt
wc -c actual_sequences2.txt

# Counting number each base
grep 'A' actual_sequences2.txt | wc -c
grep 'T' actual_sequences2.txt | wc -c
grep 'C' actual_sequences2.txt | wc -c
grep 'G' actual_sequences2.txt | wc -c