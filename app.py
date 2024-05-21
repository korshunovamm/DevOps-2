from flask import Flask, jsonify
from datetime import datetime
import requests


app = Flask(__name__)
time_request_count = 0
url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"

@app.route('/time', methods=['GET'])
def get_time():
    global time_request_count
    time_request_count += 1
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()['datetime']


@app.route('/statistics', methods=['GET'])
def get_statistics():
    return jsonify({'time_request_count': time_request_count})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
