#usage : python3 create_connection.py ../config/connections/gs_to_postgres_restaurants_godavari_usa.json


import requests
import json
import sys
from utils import get_encoded_credentials

def main(config_file):
    # Replace with your Airbyte API credentials
    username = "airbyte"
    password = "password"

    encoded_credentials = get_encoded_credentials(username, password)

    # Read the configuration file
    with open(config_file, 'r') as file:
        payload = json.load(file)

    print("Payload:", json.dumps(payload, indent=2))  # Print payload for debugging

    # Update the URL for your local Airbyte instance
    url = "http://localhost:8000/api/v1/connections/create"

    headers = {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": f"Basic {encoded_credentials}"
    }

    response = requests.post(url, json=payload, headers=headers)
    print("Response Status Code:", response.status_code)
    print("Response Text:", response.text)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 create_connection.py <config_file>")
        sys.exit(1)

    config_file = sys.argv[1]
    main(config_file)
