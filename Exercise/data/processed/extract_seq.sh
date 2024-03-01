

grep "^>" *.fa > ../processed/sequence_names.txt

cut -d ':' -f 2-5 ../processed/sequence_names.txt > processed/sequence_names2.txt 
