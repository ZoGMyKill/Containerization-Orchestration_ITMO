from jupyterhub.auth import DummyAuthenticator

c = get_config()

# Используем DummyAuthenticator для простого входа
c.JupyterHub.authenticator_class = DummyAuthenticator

c.DummyAuthenticator.password = "admin"

c.Authenticator.admin_users = {'admin'}

c.JupyterHub.port = 8000

c.Authenticator.allowed_users = {'admin'}

# Увеличиваем время ожидания
c.Spawner.http_timeout = 60
c.Spawner.start_timeout = 60

# Используем SimpleLocalProcessSpawner
c.JupyterHub.spawner_class = 'simple'
