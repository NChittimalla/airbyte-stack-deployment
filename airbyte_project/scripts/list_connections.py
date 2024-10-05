#usage: python3 list_connections.py 1bf57f8b-fbf9-4b14-b7ae-13964c25de47
#usage : python3 list_connections.py <workspace id>


import requests
import json
import sys
from utils import get_encoded_credentials

# Replace with your Airbyte API credentials
username = "airbyte"
password = "password"

# Get encoded credentials
encoded_credentials = get_encoded_credentials(username, password)

# Check if workspaceId is passed as an argument
if len(sys.argv) != 2:
    print("Usage: python3 list_connections.py <workspaceId>")
    sys.exit(1)

workspace_id = sys.argv[1]

# Airbyte API URL for listing connections
url = f"http://localhost:8000/api/v1/connections/list"

# Headers including the Authorization header with Basic encoded credentials
headers = {
    "accept": "application/json",
    "content-type": "application/json",
    "Authorization": f"Basic {encoded_credentials}"
}

# Payload with workspaceId
payload = {
    "workspaceId": workspace_id
}

# Make the request to list connections
response = requests.post(url, json=payload, headers=headers)

# Print response status and text
if response.status_code == 200:
    connections = response.json()
    print(json.dumps(connections, indent=2))
else:
    print("Failed to retrieve connections")
    print("Response Status Code:", response.status_code)
    print("Response Text:", response.text)
