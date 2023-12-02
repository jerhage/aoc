#!/usr/bin/env bash

YEAR="$1"
DAY="$2"

#create dir
mkdir -p "$YEAR/$DAY"
cd "$YEAR/$DAY" || exit

touch output1 output2

if [ ! -f main1.go ]; then cp ../../aoc.template main1.go; fi
if [ ! -f main2.go ]; then cp ../../aoc.template main2.go; fi

if [ ! -f Makefile ]; then cat >Makefile <<EOF
main1:
	go build -o main1 main1.go common.go

main2:
	go build -o main2 main2.go common.go

.PHONY: run1 run2 clean

run1: main1
	./main1 <input

run2: main2
	./main2 <input

clean:
	rm -f main1 main2

EOF
fi

# download input files
curl -v --cookie "session=$AOC_SESSION;" "https://adventofcode.com/$YEAR/day/$DAY/input" >input

# download assignment
curl -v --cookie "session=$AOC_SESSION;" "https://adventofcode.com/$YEAR/day/$DAY" | pup 'article.day-desc' >tmp.html
lynx -dump tmp.html -width 80 >assignment
rm -f tmp.html
