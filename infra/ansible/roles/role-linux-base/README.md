# role-linux-base

Base Linux configuration.


# Tags

* `swap` - Swap file related actions
* `systemd` - Systemd related actions
* `services` - Alias for `systemd`
* `packages` - Yum packages installation and related
* `yum` - Alias for `packages`

# Variables

## Input variables

* `yum_packages_group` - Additional yum packages for the group (to be used under group_vars)
* `yum_packages_host` - Additional yum packages for the host (to be used under host_vars)
* `yum_repo_packages_group` - Additional yum packages containing repos for the group (eg. epel, scl)
* `yum_repo_packages_host` - Additional yum packages containing repos for the host (eg. epel, scl)
* `nameservers` - List of nameservers to use
* `swap_file_enabled` - Whether to create swap file or not
* `swap_file_path` - Path to the swap file
* `swap_file_size_mb` - Size of the swap file in MB
* `sysctl_params_group` - List of sysctl parameters for the group
* `sysctl_params_host` - List of sysctl parameters for the host
* `systemd_services_host` - List of systemd services to configure for the group
* `systemd_services_group` - List of systemd services to configure for the host

## Output variables

* `linux_os_family` - Defines OS family with major version (eg. redhat-7, redhat-8)
* `linux_os_distribution` - Defines OS distribution with major version (eg. centos-7, oraclelinux-8)

# Examples

```yaml
- name: Initial configuration
  hosts: all
  gather_facts: yes

  roles:
    - role: role-linux-base

```
