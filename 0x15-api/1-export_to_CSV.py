#!/usr/bin/python3
"""exporting to csv"""

import csv
import requests
import sys


def export_to_csv(id):
    """exporting data to csv"""
    url = "https://jsonplaceholder.typicode.com/"
    user_info = requests.get(f"{url}/users/{id}")
    usr_info_json = user_info.json()
    tasks = requests.get(f"{url}/todos?userId={id}")
    tasks_json = tasks.json()
    employee_name = usr_info_json.get("username")

    # writing to csv
    csv_filename = f"{id}.csv"
    with open(csv_filename, 'w', newline='') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        for task in tasks_json:
            writer.writerow([id, employee_name, task.get("completed"),
                             task.get("title")])


if __name__ == "__main__":
    if len(sys.argv) == 2:
        id = sys.argv[1]
        export_to_csv(id)
