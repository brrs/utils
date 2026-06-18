# show the top 5 IP addresses by number of requests + number of requests
cut -d " " -f1 access.log | sort | uniq -c | sort -nr | head -n 5

# find all records with 404 codes and write to the file
grep 404 access.log > 404s.txt

# count unique IP's
cut -d " " -f1 access.log | sort | uniq | wc -l
