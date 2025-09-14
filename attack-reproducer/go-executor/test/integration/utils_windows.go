//go:build windows

package integration

import (
	"fmt"
	"os/exec"
)

// stopProcess stops a running command process on Windows using taskkill.
func stopProcess(cmd *exec.Cmd) error {
	kill := exec.Command("TASKKILL", "/T", "/F", "/PID", fmt.Sprintf("%d", cmd.Process.Pid))
	err := kill.Run()
	// Ignore "not found" errors, as the process may have already exited.
	if err != nil {
		if exitErr, ok := err.(*exec.ExitError); ok {
			// Exit code 128 means process not found.
			if exitErr.ExitCode() == 128 {
				return nil
			}
		}
		return err
	}
	return nil
}
