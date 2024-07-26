# 0x17. Web Stack Debugging #3

## ALX: Scripting. DevOps. SysAdmin. Debugging

## Project Overview

This project is part of the ALX SE curriculum and focuses on using `strace` to debug a web stack. Specifically, you will identify and resolve an issue causing Apache to return a 500 Internal Server Error. The goal is to develop and enhance your debugging skills by leveraging system calls and understanding how they interact with web server processes.

## Objectives

- Understand and use `strace` to trace system calls and signals.
- Diagnose and fix an issue causing a 500 Internal Server Error in Apache.
- Develop a deeper understanding of web server operations and common issues.

## Requirements

- All files should be interpreted on Ubuntu 20.04 LTS.
- All files should end with a new line.
- A `README.md` file, at the root of the folder of the project, is mandatory.
- Your Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors.
- Your Puppet manifests must run without error.
- Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about.
- Your Puppet manifest files must end with the extension `.pp`.

## Project Tasks

### Task 0: Strace Apache

#### Description

In this task, you will use `strace` to debug an issue causing Apache to return a 500 Internal Server Error. You need to identify the problem and provide a solution to fix it.

#### Instructions

1. **Setup Apache Server**: Ensure Apache is installed and running on your server.
2. **Simulate Error**: Modify Apache configuration or files to simulate a 500 Internal Server Error.
3. **Use strace**: Run `strace` on the Apache process to capture system calls and signals:
   ```bash
   sudo strace -p $(pgrep apache2) -o /tmp/strace_output.log
   ```
4. **Analyze Output**: Review the `strace` output to identify the root cause of the 500 error.
5. **Fix the Issue**: Apply the necessary fix to resolve the error.
6. **Verification**: Restart Apache and verify that the 500 error is resolved.

#### Example

Here’s a basic example of how to use `strace` to debug Apache:

```bash
sudo apt update
sudo apt install apache2 strace

# Simulate 500 Error by modifying Apache config or permissions
sudo mv /var/www/html/index.html /var/www/html/index.html.bak
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/index.php
sudo chmod 000 /var/www/html/index.php

# Restart Apache to apply changes
sudo systemctl restart apache2

# Use strace to capture system calls
sudo strace -p $(pgrep apache2) -o /tmp/strace_output.log

# Analyze the strace output
cat /tmp/strace_output.log | grep "EACCES"
```

### Deliverables

- A `README.md` file describing your debugging process, findings, and the solution applied.
- A Puppet manifest file (`0-strace_is_your_friend.pp`) that can be used to reproduce the issue and apply the fix.

## Resources

- [strace man page](https://man7.org/linux/man-pages/man1/strace.1.html)
- [Apache HTTP Server Documentation](https://httpd.apache.org/docs/2.4/)
- [Puppet Documentation](https://puppet.com/docs/puppet/latest/puppet_index.html)

## Author

- **Mojibola Olalekan**

---

This `README.md` should provide clear instructions and a structured approach to using `strace` for debugging Apache, ensuring you can effectively diagnose and resolve a 500 Internal Server Error.
