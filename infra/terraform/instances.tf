
resource "vultr_instance" "ghr" {

    count = "${var.github_runners_count}"

    plan = "${var.github_runners_plan}"
    region = "${var.github_runners_region}"
    os_id = 448

    label = "ghr-${var.github_runners_plan}-${count.index + 1}"
    tags = ["github_runner"]
    
    hostname = "ghr-${var.github_runners_plan}-${count.index + 1}"
    enable_ipv6 = true
    backups = "disabled"

    ddos_protection = false
    activation_email = false

    ssh_key_ids = [
        "429dce16-9f03-4d6a-b001-e056c3ac46c3",
        "9b6c58c5-d67c-46eb-85f2-2dba576a90df",
        "88e8d67c-64b7-4b42-8dd1-8e525036fe41"
    ]

    connection {
        type     = "ssh"
        user     = "root"
        host     = self.main_ip
    }

    provisioner "remote-exec" {
        inline = [
            "yum install ansible",
            "ansible-pull -v --diff -i localhost, -U ${var.ansible_repo} -C ${var.ansible_repo_ref} 001_initialise.yml 030_containers.yml"
        ]
    }

}

