package main

import (
	"bytes"
	"os/exec"
	"testing"
)

// Helper function to run a command and capture its output
func runCommand(t *testing.T, name string, args ...string) (string, error) {
	cmd := exec.Command(name, args...)
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out
	err := cmd.Run()
	return out.String(), err
}

func TestTerraformInit(t *testing.T) {
	cwd, err := os.Getwd()
	if err != nil {
		t.Fatalf("Failed to get current working directory: %v", err)
	}
	t.Logf("Current working directory: %s", cwd)
	
	output, err := runCommand(t, "terraform", "init", "-input=false")
	if err != nil {
		t.Fatalf("terraform init failed: %v\nOutput: %s", err, output)
	}
	t.Logf("terraform init succeeded\nOutput: %s", output)
}

func TestTerraformValidate(t *testing.T) {
	output, err := runCommand(t, "terraform", "validate")
	if err != nil {
		t.Fatalf("terraform validate failed: %v\nOutput: %s", err, output)
	}
	t.Logf("terraform validate succeeded\nOutput: %s", output)
}
