# show the top 5 IP addresses by number of requests + number of requests

cut -d " " -f1 access.log | sort | uniq -c |  sort -nr | head -n 5
