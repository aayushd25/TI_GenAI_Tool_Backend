FROM python:3.9-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Use gunicorn to serve your Flask app. 
# (Assumes your app instance is named "app" in flask_server.py)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "flask_server:app"]
