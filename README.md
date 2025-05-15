Instructions for creating infrastructure resources in Terraform cloud.
3 x Workspaces.
2 x Variable ( 1 x Environment, 1 x Terraform ).
1 x VCS directory in Github.


1. Make sure Terraform and Git are already installed on your Linux machine.
2. On your Linux machine enter the command terminal and run the command below.
It will automate the full process: downloading the repo, creating variables and applying the resources in Terraform cloud.


sudo dnf update -y && \
sudo dnf install -y yum-utils && \
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
sudo dnf install -y terraform && \
sudo git clone https://xxx/dstv1/Terraform.git $HOME/TFtask && \
cd $HOME/TFtask && \
sudo bash -c 'echo "mytf_api_token = \"xxx\"" > terraform.tfvars' && \
echo 'gh_token = "xxx"' >> terraform.tfvars && \
echo 'var-ENV = "ENV Hi all CLI workspaces"' >> terraform.tfvars && \
echo 'var-TF = "TF Hi all CLI workspaces"' >> terraform.tfvars && \
echo 'organization = "my-test-hcporg"' >> terraform.tfvars && \
sudo terraform init && \
sudo terraform apply -auto-approve 

4. This will delete all resources created above.
cd $HOME/TFtask && terraform destroy -auto-approve && cd $HOME && rm -rf TFtask
