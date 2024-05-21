from prometheus_client import start_http_server, Gauge
import requests
import time

REQUEST_COUNT = Gauge('request_count', 'Количество запросов времени')
url = "http://app-service:5000/statistics"


def get_statistics():
    while True:
        response = requests.get(url)
        request_count = int(response.text)
        REQUEST_COUNT.set(request_count)
        time.sleep(30)


if __name__ == '__main__':
    start_http_server(8000)
    get_statistics()