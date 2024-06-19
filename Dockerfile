FROM jupyterhub/jupyterhub:3.1.1

# Устанавливаем нужные зависимости
RUN pip install --no-cache-dir jupyterhub-nativeauthenticator psycopg2-binary notebook

# Создаем пользователя для JupyterHub
RUN useradd -ms /bin/bash admin

# Копируем конфигурационный файл JupyterHub
COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
COPY app.py /srv/jupyterhub/app.py

# Устанавливаем права для конфигурационного файла и скриптов
RUN chown -R admin:admin /srv/jupyterhub
USER admin

# Рабочая директория
WORKDIR /srv/jupyterhub

# Команда по умолчанию для запуска JupyterHub
CMD ["python3", "app.py"]