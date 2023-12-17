# Use the remote image as the base
#FROM ghcr.io/ggerganov/llama.cpp:light
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y cmake git g++

# Set the working directory inside the container
WORKDIR /app

#RUN git clone https://github.com/ggerganov/llama.cpp
#WORKDIR /app/llama.cpp
#RUN make
#RUN cd ..
#WORKDIR /app

# Copy the model file from your current directory to the container
# Replace 'model_file' with the actual name of your model file
COPY ./model_file.gguf /app/

# Rest of your Dockerfile commands...
# You can add other commands here to configure your container

CMD ["sh"]
