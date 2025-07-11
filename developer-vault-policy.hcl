path "dev-secrets/+/creds" {
   capabilities = ["create", "list", "read", "update"]
}

path "database/creds/*" {
   capabilities = ["create", "list", "read", "update"]
}
