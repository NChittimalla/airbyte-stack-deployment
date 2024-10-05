FROM python:3.9-slim

# Set the working directory
WORKDIR /dagster/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run the Dagster instance
CMD ["dagit", "-h", "0.0.0.0", "-p", "3000"]
