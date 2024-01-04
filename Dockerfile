FROM python:3.12-alpine as base
FROM base as builder

RUN mkdir /install
WORKDIR /install

COPY requirements.txt /
RUN pip install --prefix=/install -r /requirements.txt

FROM base
COPY --from=builder /install /usr/local
COPY src /app
WORKDIR /app

CMD [ "python", "-u", "/app/amcrest2mqtt.py" ]
