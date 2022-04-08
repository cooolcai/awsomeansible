#说明：使用1603新的模板测试资源，搭建3节点K8S尝试一键安装。

# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "administrator@1603.com"
  password       = "I.lw@202020"
  vsphere_server = "192.168.101.209"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

# Deploy  linux VMs
module "example-server-linuxvm" {
  source    = "Terraform-VMWare-Modules/vm/vsphere"
  version   = "3.4.1"
  vmtemp    = "centos792009-2c2g-ilw@2021a-thin80g"
  instances = 3
  vmname    = "K8S-18.6-docker-Czm.Wx"
  vmrp      = "Resources"
  cpu_number = 8
  ram_size = 8192
  cpu_hot_add_enabled = true
  dns_server_list = ["10.43.10.1","192.168.101.154"]
  network = {
    "DPortGroup-VID_310-TEST.测试区-10.43.10.x" = ["10.43.10.78", "10.43.10.79", "10.43.10.80"] # To use DHCP create Empty list ["",""]; You can also use a CIDR annotation;
  }
  vmgateway = "10.43.10.1"
  dc        = "Datacenter-1603"
  datastore = "v3500-8TB-02"
}
