package main

import (
	"bytes"
	"os/exec"
	"testing"
)

// Helper function to run a command and capture its output
func runCommand(dir string, name string, args ...string) (string, error) {
	cmd := exec.Command(name, args...)
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out
	err := cmd.Run()
	return out.String(), err
}

func TestTerraformInit(t *testing.T) {
	dirFlag := flag.String("dir", ".", "Directory containing Terraform files")
	flag.Parse()
	dir := *dirFlag
	
	output, err := runCommand(dir, "terraform", "init", "-input=false")
	if err != nil {
		t.Fatalf("terraform init failed: %v\nOutput: %s", err, output)
	}
	t.Logf("terraform init succeeded\nOutput: %s", output)
}

func TestTerraformValidate(t *testing.T) {
	dirFlag := flag.String("dir", ".", "Directory containing Terraform files")
	flag.Parse()
	dir := *dirFlag

	output, err := runCommand(dir, "terraform", "validate")
	if err != nil {
		t.Fatalf("terraform validate failed: %v\nOutput: %s", err, output)
	}
	t.Logf("terraform validate succeeded\nOutput: %s", output)
}
