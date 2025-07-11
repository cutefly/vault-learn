# Installed info

```text
$ vault operator init -key-shares=1 -key-threshold=1
Unseal Key 1: lLlu4VzJ********

Initial Root Token: hvs.********

Vault initialized with 1 key shares and a key threshold of 1. Please securely
distribute the key shares printed above. When the Vault is re-sealed,
restarted, or stopped, you must supply at least 1 of these keys to unseal it
before it can start servicing requests.

Vault does not store the generated root key. Without at least 1 keys to
reconstruct the root key, Vault will remain permanently sealed!

It is possible to generate new unseal keys, provided you have a quorum of
existing unseal keys shares. See "vault operator rekey" for more information.

$ export VAULT_ADDR=https://vault.club012.com

$ vault operator unseal
Unseal Key (will be hidden):

$ vault login
Token (will be hidden):

$ vault status
Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.20.0
Build Date      2025-06-23T10:21:30Z
Storage Type    file
Cluster Name    vault-cluster-912dcd3d
Cluster ID      6d6b279c-d5f3-d4ab-e89e-330a7b2420f4
HA Enabled      false
```
