# Описание задачи

Написать два Dockerfile – плохой и хороший. Описать все плохие практики из кода плохого Dockerfile и почему они плохие, как они были исправлены в хорошем Dockerfile. Также указать две плохие практики по использованию контейнеров и два случая, когда не стоит использовать контейнеры в целом.

## Разворачивание
```
docker build -f Dockerfile_bad -t dock_bad .
docker run --rm -d dock_bad

docker build -f Dockerfile_good -t dock_good .
docker run --rm -d -p 8000:8000 dock_good
```

## Что не надо делать, чтобы докер был плохим
1. Оптимизация команд RUN: Объединение установок зависимостей в одну команду RUN уменьшает количество слоев, что снижает размер образа.
2. Фиксированная версия базового образа: Использование jupyterhub/jupyterhub:3.1.1 гарантирует, что образ будет стабилен и предсказуем, а также можно будет откатиться к "последней" версии
3. Использование специализированного образа: Использование специального образа упрощает настройку и включает множество предустановленных пакетов и конфигураций, что уменьшает количество необходимых ручных настроек и зачастую уменьшает размер образа.

## Плохой/хороший докер

1. **Установка зависимостей в нескольких RUN командах**:
    - Почему это плохо: Каждая команда RUN создает новый слой в Docker образе, увеличивая его размер. Мешает кэшированию (при необходимости) если раставлять команды где попало.
    - Исправление: Объединение всех установок в одну RUN команду по логике операций.

2. **Работа под root пользователем**:
    - Почему это плохо: Работа под root пользователем в контейнере увеличивает риск безопасности.
    - Исправление: Создание и использование непривилегированного пользователя для запуска приложения.

3. **Использование неоптимального образа:
    - Почему это плохо: Докер будет тяжеловеснее и менее функциональный если к нему не приложить руку.
    - Исправление: Использовать образ заточенный именно под задачу докера (а он выполняет только одну задачу всей своей жизни), в котором убрано все лишнее и добавлено все необходимое.

## Когда не стоит использовать контейнеры

1. **Приложения с высокими требованиями к производительности (скорости)**:
    - Контейнеризация может добавить некоторые накладные расходы, поэтому приложения, которые требуют прямого доступа к оборудованию или низкой задержке, могут работать лучше без контейнеров..

2. **Если вам нужно упростить разработку и отладку**:
    - Если у нас сложная и трудоемкая процедура деплоймента, Docker нам существенно поможет. А если у нас простое приложение, он только все усложнит..
