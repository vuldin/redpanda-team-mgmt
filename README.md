This branch demonstrates the chicken & egg issue around enabling SASL but then having no way to create a SASL user with `SCRAM-SHA-512` mechanism prior to the cluster starting (and requiring this user).

```
./generate-certs.sh
./delete-data.sh
docker compose -p chicken-egg -f compose.redpanda-0.yaml -f compose.redpanda-1.yaml -f compose.redpanda-2.yaml up
docker exec -it redpanda-0.local rpk acl user create admin -p adminpassword --mechanism SCRAM-SHA-512 -X admin.tls.ca=/etc/redpanda/certs/ca.crt
```

The above steps generate self-signed certs, deletes data and fix file ownership for Redpanda, starts the cluster with SASL enabled, and then attempts to create an admin user as needed. The Redpanda compose files have setting the environment variable `RP_BOOTSTRAP_USER` commented out, since using it would only create a user with `SCRAM-SHA-256`. SASL is configured on the external Kafka port 9092.

