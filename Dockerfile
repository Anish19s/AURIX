
# 1. Use an official Python runtime
FROM python:3.12-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Prevent Python from generating bytecode files
ENV PYTHONDONTWRITEBYTECODE=1

# 4. Ensure Python logs appear immediately
ENV PYTHONUNBUFFERED=1

# 5. Copy dependency definitions first
COPY requirements.txt .

# 6. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 7. Copy the AURIX project into the container
COPY . .

# 8. Default command (we'll replace this with the application entry point)
CMD ["python", "--version"]
