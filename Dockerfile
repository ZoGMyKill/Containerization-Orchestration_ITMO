FROM jupyterhub/jupyterhub:3.1.1

RUN apt update && apt -y install git vim

RUN useradd -ms /bin/bash jupyter

USER jupyter

WORKDIR /home/jupyter

VOLUME /app/data

ENTRYPOINT ["jupyterhub", "--log-level=DEBUG"]