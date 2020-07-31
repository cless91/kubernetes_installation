use the script `terraform_ansible/deploy.sh`:

- create a file `secret.tfvars` as follows :
```
access_key = "$awsAccessKey"
secret_key = "$awsSecretKey"
```

# terraform_ansible

run standalone ansible playbook : 

`ansible-playbook -i inventory playbook.yml --extra-vars "ansible_sudo_pass=pknfz1!" -e "ansible_ssh_user=cloud_user"`
