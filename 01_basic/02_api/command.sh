echo "SEND COMMANDS TO TEST INSTANCE: E01_02_API"

echo "Check Flow-Id 1:"
curl -s --location --request POST 'http://127.0.1:8001/api/v1/instances/E01_02_API/_command' \
--header 'Content-Type: application/json' \
--data-raw '{
    "command": "stream-info",
    "arguments": {
        "flow-id": 1
    }
}' | jq .

echo "Check Flow-Id 2:"
curl -s --location --request POST 'http://127.0.1:8001/api/v1/instances/E01_02_API/_command' \
--header 'Content-Type: application/json' \
--data-raw '{
    "command": "stream-info",
    "arguments": {
        "flow-id": 2
    }
}' | jq .