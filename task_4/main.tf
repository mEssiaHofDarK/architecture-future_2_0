terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.compute_zone
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "testvm" {
  name = "test-vm-disk"
  type = "network-ssd"
  zone = var.compute_zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size = 15
}

resource "yandex_compute_instance" "testvm" {
  name = "test-vm"
  zone = var.compute_zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_mem
  }

  boot_disk {
    disk_id = yandex_compute_disk.testvm.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}