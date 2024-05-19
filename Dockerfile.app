FROM ubuntu:latest

RUN apt-get install -y python3-pip python3-dev build-essential python3-flask

WORKDIR /app

COPY app.py /app

EXPOSE 5000

CMD ["python3", "app.py"]
