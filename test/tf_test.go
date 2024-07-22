package main

import (
	"bytes"
	"flag"
	"os"
	"os/exec"
	"testing"
)

var dir string

// Helper function to run a command and capture its output
func runCommand(t *testing.T, dir string, name string, args ...string) (string, error) {
	cmd := exec.Command(name, args...)
	cmd.Dir = dir
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out
	err := cmd.Run()
	return out.String(), err
}

func TestTerraformInit(t *testing.T) {
	output, err := runCommand(t, dir, "terraform", "init", "-input=false")
	if err != nil {
		t.Fatalf("terraform init failed: %v\nOutput: %s", err, output)
	}
	t.Logf("terraform init succeeded\nOutput: %s", output)
}

func TestTerraformValidate(t *testing.T) {
	output, err := runCommand(t, dir, "terraform", "validate")
	if err != nil {
		t.Fatalf("terraform validate failed: %v\nOutput: %s", err, output)
	}
	t.Logf("terraform validate succeeded\nOutput: %s", output)
}

func TestMain(m *testing.M) {
	// Set the directory where the Terraform configuration files are located
	flag.StringVar(&dir, "dir", ".", "directory containing Terraform configuration files")
	flag.Parse()

	if dir == "" {
		flag.Usage()
		os.Exit(1)
	}

	// Run the tests
	os.Exit(m.Run())
}