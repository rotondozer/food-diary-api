#!/bin/bash

API="${API_ORIGIN:-https://food-diary-api.herokuapp.com}"
URL_PATH="/date_masters"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "date_master": {
      "date": "'"${DATE}"'",
      "user_id": "'"${USERID}"'"
    }
  }'

echo
