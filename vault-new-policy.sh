### CURL to Grep existing policy from entity id then grep list of policy inside the json to policies file
curl \
    --header "X-Vault-Token: <vault-root-token>" \
    <your-vault-domain-or-ip>/v1/identity/entity/id/<entity-id-created-from-vault-guide> | jq '.data.policies[]' > policies

### CURL to create new policy for new Secret Engine
curl \
    --header "X-Vault-Token: <vault-root-token>" \
    --request POST \
    --data '{"policy": "path \"<your-kv-v2-engine-name>/+/*\" {\n  capabilities = [\"create\", \"read\", \"list\", \"update\"]\n}\n"}' \
    <your-vault-domain-or-ip>/v1/sys/policy/<your-kv-v2-engine-name>

### Append new policy name to policies file
echo "\"<your-kv-v2-engine-name>\"" >> policies

### change value string to Value array using the content of policies file and change newline to comma
sed -i "s/value/$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/,/g' policies)/g" policy-payload.json

### update policy attached to entity
curl \
    --header "X-Vault-Token: <vault-root-token>" \
    --request POST \
    --data @policy-payload.json \
    <your-vault-domain-or-ip>/v1/identity/entity/id/<entity-id-created-from-vault-guide>

### update policy attached to group
curl \
    --header "X-Vault-Token: <vault-root-token>" \
    --request POST \
    --data @policy-payload.json \
    <your-vault-domain-or-ip>/v1/identity/group/id/<group-id-created-from-vault-guide>