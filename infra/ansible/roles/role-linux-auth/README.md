# Role manipulates users and ssh keys

## Variables

```yaml
permit_root_login: true
permit_password_auth: true 

users:
  - name: "user_a",
    shell: "/bin/bash",          # optional
    uid: "1200",                 # optional
    groups: "wheel",             # optional
    ssh_key: "ssh-rsa AAAB user" # optional
    password: "$6$BzWt..."       # optional
    extra_ssh_keys:              # optional
      - "ssh-rsa BBBB user"      # optional
      - "ssh-rsa CCCC user"      # optional

host_users:                      # to be used in host_vars
  - name: "user_a",
    extra_ssh_keys:              # optional
      - "ssh-rsa BBBB user"      # optional
      - "ssh-rsa CCCC user"      # optional

deleted_users:
   - name: "user_z"
   - name: "user_y"
```
