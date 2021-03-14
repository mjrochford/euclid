package main

import (
// "fmt"
)

func main() {
	/*
		fmt.Printf("gcd(%d, %d) = %d\n", 15, 3, gcd_euclid(15, 3))
		fmt.Printf("gcd(%d, %d) = %d\n", 16, 15, gcd_euclid(16, 15))
		fmt.Printf("gcd(%d, %d) = %d\n", 57, 12, gcd_euclid(57, 12))
		fmt.Printf("gcd(%d, %d) = %d\n", 600, 53, gcd_euclid(600, 53))
	*/

	assert(gcd_euclid(15, 3) == 3)
	assert(gcd_euclid(16, 15) == 1)
	assert(gcd_euclid(57, 12) == 3)
	assert(gcd_euclid(600, 53) == 1)
}

func assert(condition bool) {
	if !condition {
		panic("assert failed")
	}
}

func gcd_euclid(a int, b int) int {
	for b != 0 {
		temp := b
		b = a % b
		a = temp
	}
	return a
}
