FROM ubuntu:latest

# Install dependencies for downloading and running ActiveTcl
RUN apt-get update && apt-get install -y wget

# Download and install ActiveTcl
RUN wget https://downloads.activestate.com/ActiveTcl/releases/8.6.8/ActiveTcl8.6.8.0.298892-linux-x86_64-threaded.tar.gz \
    && tar -xzf ActiveTcl8.6.8.0.298892-linux-x86_64-threaded.tar.gz \
    && cd ActiveTcl8.6.8.0.298892-linux-x86_64-threaded \
    && ./install.sh --prefix /usr/local

# Set the working directory
WORKDIR /app

# Copy the application source code to the container
COPY . /app

# Run your TCL script
CMD ["tclsh", "bake.tcl"]
