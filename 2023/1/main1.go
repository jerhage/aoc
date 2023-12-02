package main

import (
	"bufio"
	"fmt"
	"os"
    "log"
)


func parseFirstDigit(s string) int {
	for i := 0; i < len(s); i++ {
		if s[i] >= '0' && s[i] <= '9' {
			return int(s[i] - '0')
		}
	}
	log.Fatal("not found")
	return -1
}

func parseLastDigit(s string) int {
	for i := len(s) - 1; i >= 0; i-- {
		if s[i] >= '0' && s[i] <= '9' {
			return int(s[i] - '0')
		}
	}
	log.Fatal("not found")
	return -1
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	sum := 0
	for scanner.Scan() {
		line := scanner.Text()
		sum += parseFirstDigit(line)*10 + parseLastDigit(line)
	}

	fmt.Println(sum)
}
