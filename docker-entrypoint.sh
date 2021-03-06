#!/bin/bash

CODE=1
while [[ CODE -ne 0 ]]
do
  sleep 2
  echo "wait for db..."
  python wait_for_db.py $1 $2 $3 $4 $5
  CODE=$?
done

echo "flask init db"
flask init-db

echo "flask deploy"
flask deploy

echo "uwsgi start"
uwsgi config.ini

