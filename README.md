# Цифровая трансформация в действии: Сбер Эфир для распределения и расчёта эффективности расходов

Этот репозиторий является частью инновационного решения, разработанного для хакатона "Лидеры цифровой трансформации" компании Сбер. Задача проекта заключается в создании сервиса для распределения и расчёта эффективности расходов, что позволит оптимизировать управление финансовыми ресурсами компании.

Прототип представлен несколькими компонентами, каждый из которых представлен в отдельном репозитории:

- **[sber-services](https://github.com/RealityFlex/sber-services)**: Базы данных, proxy, и все вспомогательные компоненты системы.
- **[sber-back](https://github.com/RealityFlex/sber-back)**: Backend-часть приложения, ответственная за обработку данных и взаимодействие с базой данных.
- **[sber-front](https://github.com/RealityFlex/sber-front)**: Frontend-часть, обеспечивающая пользовательский интерфейс и взаимодействие с пользователями.
- **[sber_ai](https://github.com/RealityFlex/sber_ai)**: Модуль, использующий искусственный интеллект для распределения и предсказания расходов.

Для успешного запуска прототипа необходимо соблюдать инструкции в каждом из указанных репозиториев. Подробности настройки и запуска каждого компонента представлены в соответствующих README-файлах репозиториев.

----

Этот репозиторий содержит настройки для Docker-окружения многокомпонентного бэкенда, включая PostgreSQL, pgAdmin, MinIO, RabbitMQ и Redis.

### Включенные сервисы

- **PostgreSQL**: Надежная система управления реляционными базами данных.
- **pgAdmin**: Веб-интерфейс для администрирования PostgreSQL.
- **MinIO**: Высокопроизводительный сервер для хранения объектов, совместимый с API Amazon S3.
- **RabbitMQ**: Брокер сообщений, поддерживающий протоколы AMQP и другие.
- **Redis**: Хранилище данных в памяти, используемое как база данных, кэш и брокер сообщений.

### Использование

#### Предварительные требования

- Установленный Docker на вашем компьютере.

#### Установка

1. Склонируйте репозиторий:
   ```
   git clone <repository_url>
   cd <repository_directory>
   ```

2. Запустите Docker Compose:
   ```
   docker-compose up -d
   ```

   Эта команда запускает все сервисы в фоновом режиме (`-d`), позволяя им работать на заднем плане.

3. Доступ к сервисам:

   - **PostgreSQL**: Доступен по адресу `localhost:9559` с учетными данными `lct_guest/postgres`.
   - **pgAdmin**: Доступен по адресу `localhost:15432` с электронной почтой `admin@pgadmin.com` и паролем `shureck`.
   - **MinIO**: Доступен по адресу `http://localhost:9000` с учетными данными `rtuitlab/RedAlert`.
   - **RabbitMQ**: Доступен по адресу `http://localhost:15677` с учетными данными `rtuitlab/qweqweqwe`.
   - **Redis**: Доступен по адресу `localhost:6377`.

#### Настройка

- При необходимости измените порты или переменные окружения в `docker-compose.yml`.
- Убедитесь, что тома (`./postgres/container_data/db`, `./minio/data`, `./rabbitmq-data`, `./redis-data`) доступны для записи демоном Docker.

---

По всем вопросам можно обратиться к [Алекандру](https://t.me/shureck "telegram")
