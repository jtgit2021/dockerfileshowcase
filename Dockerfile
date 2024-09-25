# Use the official Ubuntu base image
FROM ubuntu:latest

# Set a working directory inside the container
WORKDIR /app

# Install necessary packages (dos2unix since .sh has carriage return (\r) characters) and clean
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl dos2unix && rm -rf /var/lib/apt/lists/*

# Copy the script to the container
COPY script.sh /app/script.sh

# Make the script executable
RUN chmod +x /app/script.sh

#fix carriage return error
RUN dos2unix /app/script.sh

# Run the script by default
CMD ["/app/script.sh"]
