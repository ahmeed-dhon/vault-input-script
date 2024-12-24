# Devops-vault

Use this bash script to batch input secret value that will be used for later deployment

## Values that need to be updated
- vault-root-token -> self explanatory
- your-kv-v2-engine-name -> self explanatory
- set-password-here -> set new password for each mongodb database, psql database or redis password

# **IMPORTANT!!! DONT COMMIT ANY UPDATE TO THIS REPO!! THIS REPO IS JUST FOR EXAMPLE**

## How to run
### Make sure that you already updated all important values that need to be changed from above

```shell
./vault-new-secret.sh ### Generate new secret engine
./vault-new-policy.sh ### Generate new policy for new secret engine above, then attached it to group and entity of Vault user
```