# Use an official base image
FROM ubuntu:latest

# Install TCL
RUN apt-get update && apt-get install -y tcl

# Set the working directory in the container
WORKDIR /app

# Copy your TCL script and other necessary files into the container
COPY . /app

# Specify the command to run your TCL script
CMD ["tclsh", "bake.tcl"]
