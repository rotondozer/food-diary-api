#!/bin/bash

API="${API_ORIGIN:-https://food-diary-api.herokuapp.com}"
URL_PATH="/food_logs"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "food_log": {
      "time": "'"${TIME}"'",
      "description": "'"${DESCRIPTION}"'",
      "calories": "'"${CALORIES}"'",
      "date_master_id": "'"${DATEMASTER}"'"
    }
  }'

echo
