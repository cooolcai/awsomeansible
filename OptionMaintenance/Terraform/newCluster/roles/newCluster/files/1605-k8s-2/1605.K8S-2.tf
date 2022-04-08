# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "administrator@1605.com"
  password       = "I.lw@202020"
  vsphere_server = "10.20.3.101"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

# Deploy  linux VMs
module "example-server-linuxvm" {
  source    = "Terraform-VMWare-Modules/vm/vsphere"
  version   = "3.4.1"
  vmtemp    = "static-centos7.6-2C-2G-80G-init-bws-hotplug"
  instances = 4
  vmname    = "K8S-Czm"
  vmrp      = "terraform"
  cpu_number = 4
  ram_size = 4096
  cpu_hot_add_enabled = true
  dns_server_list =["10.20.3.1","192.168.101.154"]
  network = {
    "VM Network" = ["10.20.3.56", "10.20.3.57", "10.20.3.58", "10.20.3.59"] # To use DHCP create Empty list ["",""]; You can also use a CIDR annotation;
  }
  vmgateway = "10.20.3.1"
  dc        = "1605办公室集群"
  datastore = "v3500-1605-01"
}