# Start with a base image that has both Java and TCL
FROM openjdk:8-jdk

# Install TCL (if not already present in the base image)
RUN apt-get update && apt-get install -y tcl

# Set the working directory in the container
WORKDIR /app

# Copy the repository contents into the container
COPY . /app

# Ensure the Closure Compiler JAR is available in the container
# (This step can be skipped if the JAR is already in your repository and gets copied over)
ADD https://dl.google.com/closure-compiler/compiler-latest.zip /app/compiler-latest.zip
RUN unzip compiler-latest.zip closure-compiler-v20191027.jar && \
    rm compiler-latest.zip

# Set the default command to run your TCL script
CMD ["tclsh", "bake.tcl"]
