#usage : python3 delete_destination.py <destination_id>


import requests
import sys
from utils import get_encoded_credentials

def main(destination_id):
    # Replace with your Airbyte API credentials
    username = "airbyte"
    password = "password"

    encoded_credentials = get_encoded_credentials(username, password)

    # Update the URL for your local Airbyte instance
    url = f"http://localhost:8000/api/v1/destinations/delete"

    headers = {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": f"Basic {encoded_credentials}"
    }

    payload = {
        "destinationId": destination_id
    }

    response = requests.post(url, json=payload, headers=headers)
    print("Response Status Code:", response.status_code)
    print("Response Text:", response.text)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 delete_destination.py <destination_id>")
        sys.exit(1)

    destination_id = sys.argv[1]
    main(destination_id)
