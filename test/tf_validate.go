package test

import (
	"bytes"
	"os/exec"
	"testing"
)

// runTerraformCommand runs a Terraform command in the specified directory.
func runTerraformCommand(t *testing.T, dir, command string) {
	t.Helper()

	cmd := exec.Command("terraform", command)
	cmd.Dir = dir

	var out, stderr bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &stderr

	err := cmd.Run()
	if err != nil {
		t.Errorf("Command failed with error: %v\nOutput: %s\nError: %s", err, out.String(), stderr.String())
	}
}

// TestTerraform validates Terraform configurations in specified directories.
func TestTerraform(t *testing.T) {
	// List of directories containing Terraform configurations
	directories := []string{
		"infrastructure/terraform/environments/prod",
		"infrastructure/terraform/environments/dev",
	}

	for _, dir := range directories {
		t.Run(dir, func(t *testing.T) {
			// Run `terraform init`
			runTerraformCommand(t, dir, "init -input=false")

			// Run `terraform validate`
			runTerraformCommand(t, dir, "validate")
		})
	}
}
