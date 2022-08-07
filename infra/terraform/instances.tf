resource "random_id" "ghr-redhat-8-suffix" {
  count = "${var.github_runners_count}"
  byte_length = 2
}

resource "random_id" "ghr-redhat-7-suffix" {
  count = "${var.github_runners_count}"
  byte_length = 2
}

resource "vultr_instance" "ghr-redhat-8" {

    count = "${var.github_runners_count}"

    plan = "${var.github_runners_plan}"
    region = "${var.github_runners_region}"
    os_id = 448

    label = "ghr-redhat-8-${var.github_runners_plan}-${random_id.ghr-redhat-8-suffix[count.index].hex}-${count.index + 1}"
    tags = ["github_runner"]
    
    hostname = "ghr-redhat-8-${var.github_runners_plan}-${random_id.ghr-redhat-8-suffix[count.index].hex}-${count.index + 1}"
    enable_ipv6 = true
    backups = "disabled"

    ddos_protection = false
    activation_email = false

    ssh_key_ids = [
        "429dce16-9f03-4d6a-b001-e056c3ac46c3",
        "9b6c58c5-d67c-46eb-85f2-2dba576a90df",
        "88e8d67c-64b7-4b42-8dd1-8e525036fe41",
        "277a159a-037c-4148-9eb8-6f85ed0653b7"
    ]

    connection {
        type     = "ssh"
        user     = "root"
        host     = self.main_ip
        timeout  = "10m"
        private_key = "${file("${var.ssh_private_key}")}"
    }

    provisioner "remote-exec" {
        inline = [
            "yum install -y epel-release",
            "yum install -y ansible",
            "ansible-pull -v --diff -i localhost, -U ${var.ansible_repo} -C ${var.ansible_repo_ref} -e ghr_token=${var.ansible_ghr_token} infra/ansible/001_initialise.yml infra/ansible/030_containers.yml infra/ansible/040_github_runner.yml"
        ]

    }

}

resource "vultr_instance" "ghr-redhat-7" {

    count = "${var.github_runners_count}"

    plan = "${var.github_runners_plan}"
    region = "${var.github_runners_region}"
    os_id = 381

    label = "ghr-redhat-7-${var.github_runners_plan}-${random_id.ghr-redhat-7-suffix[count.index].hex}-${count.index + 1}"
    tags = ["github_runner"]
    
    hostname = "ghr-redhat-7-${var.github_runners_plan}-${random_id.ghr-redhat-7-suffix[count.index].hex}-${count.index + 1}"
    enable_ipv6 = true
    backups = "disabled"

    ddos_protection = false
    activation_email = false

    ssh_key_ids = [
        "429dce16-9f03-4d6a-b001-e056c3ac46c3",
        "9b6c58c5-d67c-46eb-85f2-2dba576a90df",
        "88e8d67c-64b7-4b42-8dd1-8e525036fe41",
        "277a159a-037c-4148-9eb8-6f85ed0653b7"
    ]

    connection {
        type     = "ssh"
        user     = "root"
        host     = self.main_ip
        timeout  = "10m"
        private_key = "${file("${var.ssh_private_key}")}"
    }

    provisioner "remote-exec" {
        inline = [
            "yum install -y epel-release",
            "yum install -y ansible",
            "ansible-pull -v --diff -i localhost, -U ${var.ansible_repo} -C ${var.ansible_repo_ref} -e ghr_token=${var.ansible_ghr_token} infra/ansible/001_initialise.yml infra/ansible/030_containers.yml infra/ansible/040_github_runner.yml"
        ]

    }

}

