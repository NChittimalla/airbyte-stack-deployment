#usage : python3 list_destinations.py your_workspace_id
#usage : python3 list_destinations.py 1bf57f8b-fbf9-4b14-b7ae-13964c25de47

import requests
import json
import sys
from utils import get_encoded_credentials

def main(workspace_id):
    # Replace with your Airbyte API credentials
    username = "airbyte"
    password = "password"

    encoded_credentials = get_encoded_credentials(username, password)

    # Update the URL for your local Airbyte instance
    url = "http://localhost:8000/api/v1/destinations/list"

    headers = {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": f"Basic {encoded_credentials}"
    }

    payload = {
        "workspaceId": workspace_id
    }

    response = requests.post(url, headers=headers, json=payload)
    if response.status_code == 200:
        destinations = response.json()
        print("Destinations:")
        for destination in destinations['destinations']:
            print(f"Name: {destination['name']}, ID: {destination['destinationId']}")
    else:
        print("Failed to retrieve destinations")
        print("Response Status Code:", response.status_code)
        print("Response Text:", response.text)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 list_destinations.py <workspace_id>")
        sys.exit(1)

    workspace_id = sys.argv[1]
    main(workspace_id)
