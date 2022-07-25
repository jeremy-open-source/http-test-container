#!/usr/bin/env bash

set -e

BIND=${BIND:-"0.0.0.0:5000"}
WORKERS=${WORKERS:-"2"}

gunicorn --workers="${WORKERS}" --bind="${BIND}" app.wsgi:app
