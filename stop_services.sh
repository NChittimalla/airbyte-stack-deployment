#!/bin/bash

# Navigate to the airbyte/docker directory and start the Docker Compose service
cd /home/ec2-user/modern_data_stack/airbyte
docker compose stop

# Navigate to the airbyte/docker directory and start the Docker Compose service
#cd /home/ec2-user/modern_data_stack/
#docker stop 2d4683ddaeaa

# Navigate to the parent directory and then to docker/docker directory, then start the Docker Compose service
cd /home/ec2-user/modern_data_stack/
docker compose stop

echo "All services have been stopped."