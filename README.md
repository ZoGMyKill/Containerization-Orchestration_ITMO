# Описание задачи

Установить Kubernetes на локальную машину. Развернуть тестовый сервис

## kubectl
Для установки
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
Проверяем
```
kubectl version --client
```
![img](./img/inst_kubectl.jpeg)

## minikube

Для установки
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube start
```
![img](./img/inst_minikube.jpeg)
Проверяем
```
docker ps
kubectl config view
```
![img](./img/ver_kubectl.jpeg)

