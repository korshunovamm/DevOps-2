### Запуск приложения
1. Запускаем minikube:
    ```
    minikube start --vm-driver=virtualbox
    ```
2. Запускаем скрипт
    ```
    launch.sh
    ```
3. Запустить сервис 
   ```
   minikube service app-service
   ```
4. В выводе получим следующую информацию
```
🏃  Starting tunnel for service app-service.
|-----------|-------------|-------------|------------------------|
| NAMESPACE |    NAME     | TARGET PORT |          URL           |
|-----------|-------------|-------------|------------------------|
| default   | app-service |             | http://127.0.0.1:36153 |
|-----------|-------------|-------------|------------------------|

```
5. По данному url можно сдлеать запросы к эндпоинтам:
```
http://127.0.0.1:36153/time
http://127.0.0.1:36153/statistics
```

6. Получить файл statistics.txt через обращение к поду деплоймента fetcher-deployment:
```
kubectl cp fetcher-deployment-xxxxxxxxxx-xxxxx:statistics.txt ./statistics.txt
```
