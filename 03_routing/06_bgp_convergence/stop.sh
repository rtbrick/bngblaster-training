curl -i --location --request POST 'http://127.0.1:8001/api/v1/instances/E03_06_BGP_CONVERGENCE/_stop' \
    --header 'Content-Type: application/json' \
    --data-raw '{}'
curl -i --location --request DELETE 'http://127.0.1:8001/api/v1/instances/E03_06_BGP_CONVERGENCE'