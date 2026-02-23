# Apache Superset для Edumatic SQL Playground

Облачный деплой Apache Superset на Railway.app для практики SQL запросов студентами курса "Cursor для аналитиков".

---

## 🎯 Что внутри

- **Apache Superset** 3.1.0 (latest stable)
- **PostgreSQL connection** к Supabase БД
- **Admin аккаунт:** `admin@edumatic.com` / `admin123`
- **SQL Lab** — интерактивный редактор SQL
- **Charts & Dashboards** — визуализация данных

---

## 🚀 Деплой на Railway.app

### Шаг 1: Создай GitHub репозиторий

```bash
cd superset-railway
git init
git add .
git commit -m "Initial Superset setup for Edumatic"
git remote add origin https://github.com/YOUR_USERNAME/edumatic-superset.git
git push -u origin main
```

### Шаг 2: Деплой на Railway

1. Зайди на https://railway.app
2. **New Project** → **Deploy from GitHub repo**
3. Выбери репозиторий `edumatic-superset`
4. Railway автоматически найдёт `Dockerfile` и начнёт деплой

### Шаг 3: Добавь переменные окружения

В Railway Dashboard → **Variables** → добавь:

```bash
# Secret Key для Superset (сгенерируй случайный!)
SECRET_KEY=YOUR_RANDOM_SECRET_KEY_HERE_32_CHARS_MIN

# Database для метаданных Superset (создаст Railway автоматически)
# Или добавь PostgreSQL plugin в Railway

# Supabase connection (для студентов)
SUPABASE_CONNECTION=postgresql://postgres.eeewuvafkpapuihcvqdt:WhySoSerious1208@aws-1-ap-southeast-2.pooler.supabase.com:5432/postgres
```

### Шаг 4: Сгенерируй Secret Key

Запусти локально:
```bash
python -c "import secrets; print(secrets.token_urlsafe(42))"
```

Скопируй результат в `SECRET_KEY`

### Шаг 5: Добавь PostgreSQL для метаданных

В Railway Dashboard:
1. **New** → **Database** → **PostgreSQL**
2. Railway автоматически добавит `DATABASE_URL` в переменные
3. Superset будет использовать эту БД для хранения своих настроек

### Шаг 6: Получи публичный URL

Railway автоматически создаст URL типа:
```
https://edumatic-superset.up.railway.app
```

Этот URL дашь студентам!

---

## 🔐 Создание студенческих аккаунтов

После деплоя:

1. Зайди в Superset как admin: `admin@edumatic.com` / `admin123`
2. **Settings** → **List Users** → **+ User**
3. Создай аккаунты для студентов с ролью **Gamma** (read-only)

### Массовое создание (через CLI):

Railway Console → Run command:
```bash
superset fab create-user \
    --username student1 \
    --firstname Student \
    --lastname One \
    --email student1@example.com \
    --password student123 \
    --role Gamma
```

Или создай скрипт для 50 студентов.

---

## 📊 Настройка подключения к Supabase

После первого входа как admin:

1. **Settings** → **Database Connections** → **+ Database**
2. **Display Name:** `Edumatic Analytics`
3. **SQLAlchemy URI:** 
```
postgresql://postgres.eeewuvafkpapuihcvqdt:WhySoSerious1208@aws-1-ap-southeast-2.pooler.supabase.com:5432/postgres
```
4. **Test Connection** → должен показать ✅
5. **Save**

---

## 🎓 Использование студентами

### SQL Lab:
1. Студент логинится (email/password)
2. **SQL Lab** → выбирает `Edumatic Analytics` database
3. Пишет SQL запросы
4. **Run** → видит результаты
5. **Explore** → создаёт графики

### Dashboards:
- Студенты могут смотреть готовые дашборды (view-only)
- Создавать свои графики из SQL Lab

---

## 💰 Стоимость

**Railway.app:**
- $5-10/месяц (Web Service + PostgreSQL)
- Первые $5 бесплатно (trial)

**Для 50 студентов:**
- ✅ Неограниченное количество пользователей
- ✅ Неограниченное количество запросов
- ✅ Один деплой на всех

---

## 🔒 Безопасность

✅ **Read-only роль (Gamma)** для студентов  
✅ **HTTPS** автоматически  
✅ **Email/Password** авторизация  
✅ **Supabase connection** через Session Pooler (поддерживает prepared statements)

---

## 🆘 Troubleshooting

### "Cannot connect to database"
- Проверь `SUPABASE_CONNECTION` в Railway Variables
- Проверь что порт **5432** (Session mode, НЕ 6543!)

### "Secret key is too short"
- Сгенерируй новый: `python -c "import secrets; print(secrets.token_urlsafe(42))"`

---

**Готов к деплою?** 🚀  
Скажи когда залогинишься в Railway, и начнём!
