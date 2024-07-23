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

func TestTerraform(t *testing.T) {
	// init
	initOutput, initErr := runCommand(t, dir, "terraform", "init", "-input=false")
	if initErr != nil {
		t.Fatalf("terraform init failed: %v\nOutput: %s", initErr, initOutput)
	}
	t.Logf("terraform init succeeded\nOutput: %s", initOutput)

	// validate
	validateOutput, validateErr := runCommand(t, dir, "terraform", "validate")
	if validateErr != nil {
		t.Fatalf("terraform validate failed: %v\nOutput: %s", validateErr, validateOutput)
	}
	t.Logf("terraform validate succeeded\nOutput: %s", validateOutput)
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
