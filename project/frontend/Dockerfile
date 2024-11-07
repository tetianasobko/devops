# Використовуємо офіційний Node образ як базовий
FROM node:18-alpine

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо package.json та package-lock.json
COPY package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо решту файлів додатка в контейнер
COPY . .

# Вказуємо порт, який буде відкритий для доступу
EXPOSE 5173

# Запускаємо додаток за допомогою serve
CMD ["npm", "run", "dev"]
