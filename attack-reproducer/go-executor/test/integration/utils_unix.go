//go:build !windows

package integration

import (
	"os/exec"
	"syscall"
)

// stopProcess stops a running command process on Unix-like systems.
func stopProcess(cmd *exec.Cmd) error {
	// Use negative PID to kill the entire process group.
	return syscall.Kill(-cmd.Process.Pid, syscall.SIGKILL)
}
