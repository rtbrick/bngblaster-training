echo "START TEST INSTANCE: E01_02_API"
curl -i --location --request POST 'http://127.0.1:8001/api/v1/instances/E01_02_API/_stop' \
--header 'Content-Type: application/json' \
--data-raw '{
    "logging": true,
    "logging_flags": [
        "debug"
    ],
    "report": true
}'