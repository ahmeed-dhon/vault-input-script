# CURL to create new K/V v2 secret engine
curl \
    --header "X-Vault-Token: <vault-root-token>" \
    --request POST \
    --data '{"type": "kv", "options": {"version": "2"}}' \
    <your-vault-domain-or-ip>/v1/sys/mounts/<your-kv-v2-engine-name>

# CURL to input K/V to Secret Engine from step before
# you can add more key and value inside data bracket
# you can multiply this part too if you have multiple secret that needed to be inputed
curl \
    --header "X-Vault-Token: <vault-root-token>" \
    --request POST \
    --data '{"data": {"key_1": "value_1","key_2": "value_2"}}' \
    <your-vault-domain-or-ip>/v1/<your-kv-v2-engine-name>/data/<secret-name>