#usage : python3 destroy_connection.py <connectionId>
#usage : python3 destroy_connection.py 3acdcb40-7663-484a-a7f9-bbcb9c1fd6da

import requests
import json
import sys
from utils import get_encoded_credentials

# Replace with your Airbyte API credentials
username = "airbyte"
password = "password"

# Get encoded credentials
encoded_credentials = get_encoded_credentials(username, password)

# Check if connectionId is passed as an argument
if len(sys.argv) != 2:
    print("Usage: python3 destroy_connection.py <connectionId>")
    sys.exit(1)

connection_id = sys.argv[1]

# Validate the connection ID length
if len(connection_id) != 36:
    print("Invalid connection ID. It must be 36 characters long.")
    sys.exit(1)

# Airbyte API URL for deleting a connection
url = f"http://localhost:8000/api/v1/connections/delete"

# Headers including the Authorization header with Basic encoded credentials
headers = {
    "accept": "application/json",
    "content-type": "application/json",
    "Authorization": f"Basic {encoded_credentials}"
}

# Payload with connectionId
payload = {
    "connectionId": connection_id
}

# Make the request to delete the connection
response = requests.post(url, json=payload, headers=headers)

# Print response status and text
if response.status_code == 200:
    print(f"Successfully deleted connection with ID: {connection_id}")
else:
    print("Failed to delete connection")
    print("Response Status Code:", response.status_code)
    print("Response Text:", response.text)
