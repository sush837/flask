# Use Alpine-based Python image
FROM python:3.12-alpine

# Working directory
WORKDIR /app

# Copy code
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --upgrade flask
RUN pip install -e .

# Optional: Run tests (can be removed in production builds)
# RUN pip install '.[test]'
# RUN pytest

# Set environment variables for Flask
ENV FLASK_APP=flaskr
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port
EXPOSE 5000

# Command to run Flask app
CMD ["flask", "run"]
