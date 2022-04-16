FROM python:3-alpine

RUN mkdir -p /app
WORKDIR /app

RUN apk add --no-cache \
    libffi-dev~=3.4.2 \
    gcc~=10.3.1 \
    musl-dev~=1.2.2

COPY ./poetry.lock ./pyproject.toml /app/

RUN pip install --no-cache-dir poetry==1.1.13 && \
    poetry install

COPY . /app

EXPOSE 3000

CMD [ "poetry", "run", "python3", "app.py" ]
