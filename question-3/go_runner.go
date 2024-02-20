package main

import (
	"fmt"
	"log"
	"os/exec"
)

func main() {
	modifyMemoryLimit := "./modify_memory_limit.sh" // Replace with the actual path to your script

	cmd := exec.Command("/bin/bash", modifyMemoryLimit)
	out, err := cmd.Output()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("Output is:\n%s\n", out)

	setQuotaFilePath := "./set_quota_for_users_group.sh" // Replace with the actual path to your script

	cmd2 := exec.Command("/bin/bash", setQuotaFilePath)
	out2, err2 := cmd2.Output()
	if err2 != nil {
		log.Fatal(err2)
	}

	fmt.Printf("Output is:\n%s\n", out2)
}