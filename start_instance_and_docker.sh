#!/bin/bash

# EC2 instance details
INSTANCE_ID="i-0994f653e48779a3c"
EC2_USER="ec2-user"
EC2_HOST="18.116.174.37"

# Path to your remote Docker start script on the EC2 instance
REMOTE_DOCKER_START_SCRIPT="/home/ec2-user/modern_data_stack/start_services.sh"

# SSH key file
SSH_KEY="~/.ssh/id_rsa"

# Function to run a command on the EC2 instance via SSH
function run_remote_command {
    ssh -i $SSH_KEY $EC2_USER@$EC2_HOST "$1"
}

# Start the EC2 instance from local machine
echo "Starting EC2 instance $INSTANCE_ID from local machine..."
aws ec2 start-instances --instance-ids $INSTANCE_ID

# Wait for the instance to be in the running state
echo "Waiting for EC2 instance $INSTANCE_ID to enter 'running' state..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

# Update EC2_HOST with the public DNS or IP after the instance starts
EC2_HOST=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

# Wait for SSH to be available
echo "Waiting for SSH to be available on EC2 instance $INSTANCE_ID..."
while ! run_remote_command "echo 'SSH is ready'"; do
    sleep 5
done

# Start Docker services on the EC2 instance
echo "Starting Docker services on the EC2 instance..."
run_remote_command "bash $REMOTE_DOCKER_START_SCRIPT"

# Check if Docker services started successfully
if [ $? -eq 0 ]; then
    echo "Docker services started successfully on the EC2 instance."
else
    echo "Failed to start Docker services on the EC2 instance."
    exit 1
fi
