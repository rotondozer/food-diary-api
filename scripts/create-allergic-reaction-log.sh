#!/bin/bash

API="${API_ORIGIN:-https://food-diary-api.herokuapp.com}"
URL_PATH="/allergic_reaction_logs"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "allergic_reaction_log": {
      "symptom": "'"${SYMPTOM}"'",
      "time": "'"${TIME}"'",
      "date_master_id": "'"${DATEMASTER}"'"
    }
  }'

echo
