# Use the remote image as the base
FROM ghcr.io/ggerganov/llama.cpp:light

# Set the working directory inside the container
WORKDIR /app

# Copy the model file from your current directory to the container
# Replace 'model_file' with the actual name of your model file
COPY ./model.gguf /app/

# Rest of your Dockerfile commands...
# You can add other commands here to configure your container

CMD ["sh"]
