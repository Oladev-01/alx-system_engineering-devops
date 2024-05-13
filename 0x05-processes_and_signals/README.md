
---

# Processes and Signals in Linux Environment

This directory contains solutions and explanations for tasks related to processes and signals in a Linux environment, as part of the Alx curriculum.

## Table of Contents

- [Introduction](#introduction)
- [Tasks](#tasks)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In the realm of Linux systems programming, understanding processes and signals is fundamental. This directory hosts solutions to various tasks aimed at deepening understanding of how processes are managed and how signals are utilized for inter-process communication and system management.

## Tasks

1. **Task 0**: [Script displaying its PID]
   - Solution: file `0-what-is-my-pid`
   - Explanation: `defined the command for generating PID`

2. **Task 1**: [Script that displays PIDs for all users, including those without TTY]
   - Solution: `1-list_your_processes`
   - Explanation: `defined the command that satisfies the task`

3. **Task 2**: [Display PIDs of containing the word 'bash']
   - Solution: `./2-show_your_bash_pid`
   - Explanation: `made the command without using pgrep`

4. **Task 3**: [Script that displays the PIDs and the word bash]
   - Solution: `./3-show_your_bash_pid_made_easy`
   - Explanation: `use pgrep command`
5. **Task 4**: [Script that display the sentence 'To infinity and beyond' indefinitely with sleep of 2secs between each loop]
   - Solution: `4-to_infinity_and_beyond`
   - Explanation: `Check the file`
6. **Task 5**: [Script to kill the process of task 4]
   - Solution: `5-dont_stop_me_now`
   - Explanation: `check the file`
7. **Task 6**: [Script to stop the process of task 4 without kill command]
   - Solution: `6-stop_me_if_you_can`
   - Explanation: `used pkill -f <proc_name>`
8. **Task 7**: [Script that handles SIGTERM and prints 'I am invincible' when a SIGTERM signal is parsed to its process]
   - Solution: `7-highlander`
   - Explanation: `trapped the SIGTERM, execting the function that prints 'I am invincible'`
9. **Task 8**: [script that kills the process of task 7]
   - Solution: `8-beheaded_process`
   - Explanation: `use kill -9`
10. **Task 9**: [Script that creates the file /var/run/myscript.pid containing its PID.
Displays To infinity and beyond indefinitely
Displays I hate the kill command when receiving a SIGTERM signal
Displays Y U no love me?! when receiving a SIGINT signal
Deletes the file /var/run/myscript.pid and terminates itself when receiving a SIGQUIT or SIGTERM signal]
   - Solution: `100-process_and_pid_file`
   - Explanation: `check the file`
11.   **Task 10**: [creating daemon]
      - Solution: `manage_my_process, 101-manage_my_process `
      - Explanation: `check file`

## Usage

To use the solutions provided in this directory, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the directory containing the desired task solution.
3. Open the solution file using a text editor or IDE of your choice.
4. Review the code and accompanying explanation to understand the solution.

## Contributing

Contributions to this repository are welcome. If you have a solution or an improvement to an existing one, feel free to open a pull request. Please ensure that your contributions adhere to the code quality and formatting standards of this project.

## License

This project is licensed under the [MIT License](LICENSE).

---
