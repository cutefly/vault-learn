# Vault tutorial

## policy

```sh
$ vault policy write developer-vault-policy developer-vault-policy.hcl
Success! Uploaded policy: developer-vault-policy

$ vault write /auth/userpass/users/pi-vault-user \
    password='offspring' \
    policies=developer-vault-policy

$ vault login -method=userpass username=pi-vault-user
Password (will be hidden):
```

## Secrets

```sh
$ vault secrets enable -path=dev-secrets -version=2 kv
Success! Enabled the kv secrets engine at: dev-secrets/

$ vault kv put /dev-secrets/creds api-key=E6BED968-0FE3-411E-9B9B-C45812E4737A

$ vault kv get /dev-secrets/creds
```

## Database

```sql
$ psql -U postgres -W -h localhost -d postgres
postgres=# CREATE DATABASE pi OWNER pi;
postgres=# CREATE USER pi PASSWORD 'offspring' SUPERUSER;
postgres=# ALTER USER pi WITH CREATEDB;
postgres=# ALTER USER pi WITH CREATEROLE;
postgres=# select * from pg_catalog.pg_user;
postgres=# \du

$ psql -U pi -W -h localhost -d postgres
postgres=# CREATE ROLE "ro" NOINHERIT;
CREATE ROLE
postgres=# GRANT SELECT ON ALL TABLES IN SCHEMA public TO "ro";
GRANT
```

```sh
$ $vault secrets enable database
$ vault write database/config/postgresql \
  plugin_name=postgresql-database-plugin \
  connection_url="postgresql://{{username}}:{{password}}@192.168.219.153:5432/postgres?sslmode=disable" \
  allowed_roles=readonly \
  username="pi" \
  password="offspring"

$ vault write database/roles/readonly \
    db_name=postgresql \
    creation_statements=@readonly.sql \
    default_ttl=1h \
    max_ttl=24h

$ vault read database/creds/readonly
```

> 일반사용자인 경우

```hcl
# policy에 database/creds/에 대한 권한이 필요함.
path "database/creds/*" {
   capabilities = ["list", "read"]
}
```
