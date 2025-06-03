# Базовий образ
FROM python:3.13-slim

# Робоча директорія всередині контейнера
WORKDIR /app

# Копіюємо залежності
COPY pyproject.toml ./
COPY config ./config
COPY manage.py ./

# Встановлюємо uv
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Копіюємо решту коду
COPY . .

# Порт для Django
EXPOSE 8000

# Команда запуску
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
