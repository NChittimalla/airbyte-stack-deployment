#!/bin/bash

# EC2 instance details
INSTANCE_ID="i-0994f653e48779a3c"
EC2_USER="ec2-user"
EC2_HOST="18.116.174.37"

# Path to your remote Docker stop script on the EC2 instance
REMOTE_DOCKER_STOP_SCRIPT="/home/ec2-user/modern_data_stack/stop_services.sh"

# SSH key file
SSH_KEY="~/.ssh/id_rsa"

# Function to run a command on the EC2 instance via SSH
function run_remote_command {
    ssh -i $SSH_KEY $EC2_USER@$EC2_HOST "$1"
}

# Stop Docker services on the EC2 instance
echo "Stopping Docker services on the EC2 instance..."
run_remote_command "bash $REMOTE_DOCKER_STOP_SCRIPT"

# Check if Docker services stopped successfully
if [ $? -eq 0 ]; then
    echo "Docker services stopped successfully on the EC2 instance."
else
    echo "Failed to stop Docker services on the EC2 instance."
    exit 1
fi

# Stop the EC2 instance from local machine
echo "Stopping EC2 instance $INSTANCE_ID from local machine..."
aws ec2 stop-instances --instance-ids $INSTANCE_ID

# Check if the instance stop command was successful
if [ $? -eq 0 ]; then
    echo "EC2 instance $INSTANCE_ID is stopping."
else
    echo "Failed to stop EC2 instance $INSTANCE_ID."
    exit 1
fi
