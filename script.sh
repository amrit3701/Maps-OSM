#/bin/sh!

file=textfile.txt
no_lines=$(cat $file| wc -l)

for j in $(seq 2 $no_lines)
do
data=$(awk -v row=$j 'NR==row {print $3}' $file)
convert -fill blue -pointsize 72 label:$data $data.jpg
data2=$(awk -v row=$j 'NR==row {print $5}' $file)
sed -i "$j s/$data2/$data.jpg/" $file
done
