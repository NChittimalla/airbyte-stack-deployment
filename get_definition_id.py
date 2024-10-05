#python3 get_definition_id.py source "Google Sheets"
#python3 get_definition_id.py destination "Google BigQuery"


import requests
import base64
import json
import sys

# Replace with your Airbyte API credentials
username = "airbyte"
password = "password"

def get_definition_id(definition_type, definition_name):
    # Encode the credentials in Base64
    credentials = f"{username}:{password}"
    encoded_credentials = base64.b64encode(credentials.encode()).decode()

    # Set headers
    headers = {
        "Authorization": f"Basic {encoded_credentials}",
        "accept": "application/json",
        "Content-Type": "application/json"
    }

    # Set the URL based on definition type
    if definition_type == "source":
        url = 'http://localhost:8000/api/v1/source_definitions/list'
    elif definition_type == "destination":
        url = 'http://localhost:8000/api/v1/destination_definitions/list'
    else:
        print("Invalid definition type. Use 'source' or 'destination'.")
        sys.exit(1)

    # Make the request to list definitions
    response = requests.post(url, headers=headers, json={})

    # Check for successful response
    if response.status_code == 200:
        data = response.json()
        definitions = data.get(f"{definition_type}Definitions", [])
        
        # Filter for the specified definition name
        definition = next((d for d in definitions if d["name"].lower() == definition_name.lower()), None)
        
        if definition:
            print(f"{definition_name} {definition_type.capitalize()} Definition ID:", definition[f"{definition_type}DefinitionId"])
        else:
            print(f"{definition_name} {definition_type} definition not found.")
    else:
        print(f"Failed to list {definition_type} definitions: {response.status_code} - {response.text}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python get_definition_id.py <source|destination> <definition_name>")
        sys.exit(1)
    
    definition_type = sys.argv[1]
    definition_name = sys.argv[2]
    get_definition_id(definition_type, definition_name)


