# 1️⃣ Base image
FROM python:3.12-slim

# 2️⃣ Set working directory
WORKDIR /app

# 3️⃣ Copy dependency file first (layer caching)
COPY requirements.txt .

# 4️⃣ Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Copy application code
COPY app/ app/

# 6️⃣ Expose application port
EXPOSE 8080

# 7️⃣ Run the application
CMD ["python", "app/app.py"]
