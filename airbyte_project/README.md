# Airbyte Project

This project contains scripts and configurations for managing Airbyte sources, destinations, and connections using the Airbyte API with Basic Authentication.

## Folder Structure

- `config/`: Contains JSON configuration files for sources, destinations, and connections.
- `scripts/`: Contains Python scripts to create sources, destinations, and connections.
- `scripts/utils.py`: Utility functions, such as encoding credentials.

## Setup Instructions

1. Install Python and the `requests` library.
   ```bash
   pip install requests
   ```

2. Replace placeholders in the configuration files and scripts with your actual values.

3. Run the scripts to create sources, destinations, and connections:
   ```bash
   python scripts/create_source.py
   python scripts/create_destination.py
   python scripts/create_connection.py
   ```
