#usage : python3 list_sources.py your_workspace_id
#usage : python3 list_sources.py fe973efc-6a88-457c-a248-2077f9c8e56c


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
    url = "http://localhost:8000/api/v1/sources/list"

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
        sources = response.json()
        print("Sources:")
        for source in sources['sources']:
            print(f"Name: {source['name']}, ID: {source['sourceId']}")
    else:
        print("Failed to retrieve sources")
        print("Response Status Code:", response.status_code)
        print("Response Text:", response.text)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 list_sources.py <workspace_id>")
        sys.exit(1)

    workspace_id = sys.argv[1]
    main(workspace_id)
