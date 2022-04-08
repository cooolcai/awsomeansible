#!/bin/bash
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host jdk.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host es-01.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host elasticsearch1.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host elasticsearch2.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host elasticsearch3.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host kibana.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host logstash.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host eskey1.yml
ansible-playbook -i /etc/ansible/ansible2/hosts/elasticsearch_host eskey2.yml

