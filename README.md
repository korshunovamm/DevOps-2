### Запуск приложения
1. Создайте Docker образы:
    ```
    docker build -t app:latest -f Dockerfile.app .
    docker build -t fetcher:latest -f Dockerfile.fetcher .
    ```
2. Запустите Kubernetes кластер с использованием kind или любого другого подходящего инструмента.
3. Загрузите Docker образы в Kubernetes:
    ```
    kind load docker-image app:latest
    kind load docker-image fetcher:latest
    ```
4. Примените Kubernetes манифесты:
    ```
    kubectl apply -f app-deployment.yaml
    kubectl apply -f fetcher-deployment.yaml
    ```