#!/usr/bin/python3
"""exporting to a json format"""

import json
import requests
import sys


def export_to_json():
    """exporting to json format"""
    url = "https://jsonplaceholder.typicode.com/"
    usr_info = requests.get(f"{url}/users/").json()
    usrs_data = {}
    for usr in usr_info:
        id = usr.get('id')
        username = usr.get('username')
        tasks = requests.get(f"{url}/todos?userId={id}").json()
        tasks_done = [{"username": username, "task": task.get('title'),
                       "completed": task.get('completed')} for task in tasks]
        usr_data = {str(id): tasks_done}
        usrs_data.update(usr_data)

    # writing to json
    json_file = "todo_all_employees.json"
    with open(json_file, 'w') as file:
        json.dump(usrs_data, file)


if __name__ == "__main__":
    export_to_json()
