FROM apache/superset:3.1.0

USER root

# Установка дополнительных драйверов
RUN pip install --no-cache-dir \
    psycopg2-binary==2.9.9 \
    redis==5.0.1

# Копируем файлы конфигурации
COPY superset_config.py /app/
COPY start.sh /app/
RUN chmod +x /app/start.sh

ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

USER superset

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8088/health || exit 1

EXPOSE 8088

# Запуск через наш скрипт
CMD ["/app/start.sh"]
