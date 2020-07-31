To use the script `terraform_ansible/deploy.sh`:

1. install `terraform-inventory` : [https://github.com/adammck/terraform-inventory](https://github.com/adammck/terraform-inventory) to create an ansible inventory from Terraform tfstate file
2. create a file `secret.tfvars` as follows :
```
access_key = "$awsAccessKey"
secret_key = "$awsSecretKey"
```
3. run the script `terraform_ansible/deploy.sh`


# terraform_ansible

run standalone ansible playbook : 

`ansible-playbook -i inventory playbook.yml --extra-vars "ansible_sudo_pass=pknfz1!" -e "ansible_ssh_user=cloud_user"`
