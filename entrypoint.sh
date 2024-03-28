#!/bin/bash

echo "----- DB migration ------ "
python manage.py migrate --no-input

echo "----- Collect static files ------ "
python manage.py collectstatic --no-input

echo "----- gunicorn start ------ "
gunicorn bulkmailer.wsgi:application --bind 0.0.0.0:8000

