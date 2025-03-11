package main

import "testing"

func TestSum(t *testing.T) {
	result := sum(2, 3)
	print(result)

	if result != 5 {
		t.Error("The result must be 5")
	}

}
