#! /bin/bash

cd terraform
terraform init
terraform apply -var-file=secret.tfvars -auto-approve
cd ..

echo "[all]" > ansible/inventory
terraform-inventory --list terraform/ | jq -r '.type_aws_instance[]' >> ansible/inventory

echo "[kube_master]" >> ansible/inventory
terraform-inventory --list terraform/ | jq -r '.kube_master[]' >> ansible/inventory

echo "[kube_workers]" >> ansible/inventory
terraform-inventory --list terraform/ | jq -r '.group_kube_workers[]' >> ansible/inventory

cd ansible
ansible-playbook -i inventory playbook.yml
