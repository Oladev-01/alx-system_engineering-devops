## 0x1B. Web Stack Debugging #4
## ALX: DevOps SysAdmin Scripting Debugging

### Project Overview

This project focuses on identifying and resolving issues related to failed requests in a web stack. The goal was to debug the root cause of the failures and implement a solution to ensure smooth operation of the web server.

### Problem Statement

During stress testing with `apachebench` (ab), it was observed that a significant number of requests were failing. Specifically, out of 2000 requests, 696 failed. The task was to identify the root cause of these failed requests and debug the issue to restore normal operation.

### Diagnosis

To diagnose the issue, the Nginx error log was analyzed. The following error messages were identified:

- `open() "/usr/share/nginx/html/index.html" failed (24: Too many open files)`

These errors indicated that the Nginx server was hitting the system limit for the number of open file descriptors, causing it to be unable to handle additional requests.

### Solution

The solution involved increasing the file descriptor limit to accommodate the higher number of connections. This was achieved by modifying the `ulimit` settings for Nginx.

#### Steps Taken

1. **Check Current Limits:**
   The current limit for open files was checked using the command `ulimit -n`.

2. **Update Nginx Configuration:**
   The `ulimit` directive was set in the Nginx configuration to allow a higher number of open file descriptors.
- in the file /etc/default/nginx
   ```nginx
  ULIMIT="-n 4096";
   ```

5. **Restart Nginx:**
   The Nginx server was restarted to apply the changes.

   ```bash
   sudo service nginx restart
   ```

### Outcome

After implementing the changes, the server was able to handle the increased load without running into the "too many open files" error. The number of failed requests was reduced to zero, confirming that the issue was successfully resolved.

### Conclusion

This project demonstrated the importance of monitoring and configuring system limits, especially in high-traffic scenarios. By increasing the file descriptor limit, the Nginx server was able to handle more simultaneous connections, ensuring reliable service delivery.

---

For any further inquiries or issues, please contact the project maintainer.

### Author

Mojibola Olalekan

---

### License

This project is licensed under the MIT License.

---------