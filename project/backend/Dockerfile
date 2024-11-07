# Вибираємо базовий образ з Python
FROM python:3.9-slim

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо файл з вимогами (requirements.txt)
COPY requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо код додатку в робочу директорію
COPY . .

# Визначаємо порт, який буде слухати додаток
EXPOSE 8000

# Запускаємо додаток
CMD ["python", "app.py"]
