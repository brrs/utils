
#!/bin/bash
 
OUTPUT="access.log"
LINES=500
 
PATHS=("/" "/index.html" "/about" "/contact" "/api/users" "/api/products" \
       "/login" "/logout" "/images/logo.png" "/css/style.css" "/js/app.js" \
       "/favicon.ico" "/admin" "/search" "/cart" "/blog/post-1" "/blog/post-2")
 
METHODS=("GET" "GET" "GET" "GET" "POST" "PUT" "DELETE")
 
STATUSES=(200 200 200 200 200 301 302 304 400 401 403 404 404 500 503)
 
MONTHS=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
 
> "$OUTPUT"
 
for ((i = 1; i <= LINES; i++)); do
    ip="$((RANDOM % 223 + 1)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
 
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
