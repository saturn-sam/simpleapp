FROM python:3.9
# FROM python:3.9-alpine
# FROM 3.9-slim-buster

WORKDIR /app

RUN pip install --upgrade pip


# RUN apk update \
#     && apk add --virtual build-deps gcc python3-dev musl-dev \
#     && apk add --no-cache mariadb-dev
COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app/

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "sh","entrypoint.sh" ]