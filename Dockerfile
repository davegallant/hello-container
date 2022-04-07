FROM python:3-alpine

RUN mkdir -p /app
WORKDIR /app

RUN apk add \
    libffi-dev \
    gcc \
    musl-dev

COPY ./poetry.lock ./pyproject.toml /app/

COPY ./poetry.lock ./pyproject.toml /app/

RUN pip install poetry && \
    poetry install

COPY . /app

EXPOSE 5000

CMD [ "poetry", "run", "python3", "app.py" ]
