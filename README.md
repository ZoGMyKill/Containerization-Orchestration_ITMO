# Описание задачи

Создать docker-compose.yml из минимум трех сервисов

## Разворачивание
```
docker-compose up --build
```

## Ответы на вопросы

1. **Можно ли ограничивать ресурсы (например, память или CPU) для сервисов в docker-compose.yml? Если нет, то почему, если да, то как?**
      -  Да можно, дополнительно прописав в docker-compose.yml дополнительные строки, подробнее в https://docs.docker.com/compose/compose-file/deploy/:
```
deploy:
  resources:
    limits:
      cpus: '0.001'
      memory: 50M
    reservations:
      cpus: '0.0001'
      memory: 20M
```

2. **Как можно запустить только определенный сервис из docker-compose.yml, не запуская остальные?**
     - Для запуска определенного сервиса из *docker-compose.yml*, не запуская остальные, можно использовать команду с указанием имени конкретного сервиса.
```
docker-compose up <NAME_APP>
```

