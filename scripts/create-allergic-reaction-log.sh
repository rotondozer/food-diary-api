#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/allergic_reaction_logs"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "allergic_reaction_log": {
      "symptom": "'"${SYMPTOM}"'",
      "date": "'"${DATE}"'",
      "time": "'"${TIME}"'"
    }
  }'

echo
