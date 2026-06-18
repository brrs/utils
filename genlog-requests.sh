#!/bin/bash
 
OUTPUT="access.log"
LINES=500
 

IPS=(215.225.119.67
215.246.20.38
216.6.243.8
216.74.164.87
217.169.106.92
217.240.141.247
218.77.138.114
218.176.242.51
218.252.137.170
219.113.95.27
220.37.29.41
220.74.72.148
220.168.198.21
220.201.220.105
221.21.64.234
221.26.68.130
221.152.154.245
222.19.148.9
222.125.137.75
222.154.253.16
223.89.122.98
223.174.76.63
223.185.179.79)


PATHS=("/" "/index.html" "/about" "/contact" "/api/users" "/api/products" \
       "/login" "/logout" "/images/logo.png" "/css/style.css" "/js/app.js" \
       "/favicon.ico" "/admin" "/search" "/cart" "/blog/post-1" "/blog/post-2")
 
METHODS=("GET" "GET" "GET" "GET" "POST" "PUT" "DELETE")
 
STATUSES=(200 200 200 200 200 301 302 304 400 401 403 404 404 500 503)
 
MONTHS=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
 
> "$OUTPUT"
 
for ((i = 1; i <= LINES; i++)); do
    ip=${IPS[$((RANDOM % ${#IPS[@]}))]}
 
 
    day=$(printf "%02d" $((RANDOM % 28 + 1)))
    month=${MONTHS[$((RANDOM % 12))]}
    year=$((2024 + RANDOM % 2))
    hour=$(printf "%02d" $((RANDOM % 24)))
    min=$(printf "%02d" $((RANDOM % 60)))
    sec=$(printf "%02d" $((RANDOM % 60)))
 
    method=${METHODS[$((RANDOM % ${#METHODS[@]}))]}
    path=${PATHS[$((RANDOM % ${#PATHS[@]}))]}
    status=${STATUSES[$((RANDOM % ${#STATUSES[@]}))]}
    size=$((RANDOM % 50000 + 100))
 
    printf '%s - - [%s/%s/%d:%s:%s:%s +0000] "%s %s HTTP/1.1" %d %d\n' \
        "$ip" "$day" "$month" "$year" "$hour" "$min" "$sec" \
        "$method" "$path" "$status" "$size" >> "$OUTPUT"
done
 
echo "Done: wrote $LINES lines to $OUTPUT" 

#meow
