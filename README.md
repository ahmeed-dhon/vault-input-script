# Vault Auto Input Script

- Use this bash script to batch input secret value that will be used for later deployment
- This script will create new policy to limit create limited access for security purpose
- You can follow this [official tutorial](https://developer.hashicorp.com/vault/tutorials/policies/policies "official tutorial") to create user with limited access through policy limitation

## Values that need to be updated
- vault-root-token -> self explanatory
- your-kv-v2-engine-name -> self explanatory

## How to run
### Make sure that you already updated all important values that need to be changed from above

```shell
./vault-new-secret.sh ### Generate new secret engine
./vault-new-policy.sh ### Generate new policy for new secret engine above, then attached it to group and entity of Vault user
```