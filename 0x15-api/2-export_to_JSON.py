#!/usr/bin/python3
"""exporting to a json format"""

import json
import requests
import sys


def export_to_json(id):
    """exporting to json format"""
    url = "https://jsonplaceholder.typicode.com/"
    usr_info = requests.get(f"{url}/users/{id}")
    usr_info_json = usr_info.json()
    tasks = requests.get(f"{url}/todos?userId={id}")
    tasks_json = tasks.json()
    username = usr_info_json.get("username")
    usr_data = []
    usr_data.append({str(id):
                     [{"task": task.get('title'),
                       "completed": task.get('completed'),
                       "username": username} for task in tasks_json]})
    # writing to json
    json_file = f"{id}.json"
    with open(json_file, 'w') as file:
        json.dump(usr_data, file)


if __name__ == "__main__":
    if len(sys.argv) == 2:
        id = sys.argv[1]
        export_to_json(id)
