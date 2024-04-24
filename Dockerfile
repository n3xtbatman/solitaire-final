# Use an official base image that has TCL pre-installed or has the capability to install TCL
FROM ubuntu:latest

# Install TCL
RUN apt-get update && apt-get install -y tcl

# Set the working directory in the container
# Assuming that your TCL script and related files are in the root directory of your repo
WORKDIR /app

# Copy the repository contents into the container
COPY . /app

# Command to run your TCL script
# This assumes that your TCL script can be run directly and is executable
# If there are additional commands required to run your script, include them here
CMD ["tclsh", "bake.tcl"]
