# Start with a base Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app
COPY . .

# Expose port 5005 for Flask
EXPOSE 5005

# Add build arguments for environment variables
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_CLUSTER
ARG DB_NAME
ARG DB_USERS_COLLECTION

# Set environment variables
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_CLUSTER=${DB_CLUSTER}
ENV DB_NAME=${DB_NAME}
ENV DB_USERS_COLLECTION=${DB_USERS_COLLECTION}

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=development

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
