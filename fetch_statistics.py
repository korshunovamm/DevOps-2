import requests
import time

url = 'http://app:5000/statistics'
while True:
    try:
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            with open('statistics.txt', 'a') as f:
                f.write(f"{time.ctime()}: {data['time_request_count']}\n")
    except Exception as e:
        print(f"An error occurred: {e}")
    time.sleep(5)
