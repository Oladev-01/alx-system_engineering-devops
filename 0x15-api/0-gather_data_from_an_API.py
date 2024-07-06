#!/usr/bin/python3
"""this module fetches data from an API"""
import requests
import sys


def fetch_todo(id):
    """this function fetches from an info based on an
    id parsed to the script"""

    url = "https://jsonplaceholder.typicode.com/"
    id_info = requests.get(f"{url}/users/{id}")
    id_info_formatted = id_info.json()
    todo_info = requests.get(f"{url}/todos?userId={id}")
    todo_info_formatted = todo_info.json()

    employee_name = id_info_formatted.get("name")
    done_list = [task for task in todo_info_formatted if task.get("completed")]
    completed = len(done_list)
    all_task = len(todo_info_formatted)
    print("Employee {} is done with tasks {}/{}:"
          .format(employee_name, completed, all_task))
    if done_list:
        for task in done_list:
            print(f"\t {task.get('title')}")


if __name__ == "__main__":
    if len(sys.argv) == 2:
        id = sys.argv[1]
        fetch_todo(id)
