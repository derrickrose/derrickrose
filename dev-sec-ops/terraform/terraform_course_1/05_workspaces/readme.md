# to create a workspace, be inside the project path then enter the command :
terraform workspace new dev
terraform workspace new prod
terraform workspace new qa
# to check availaible workspace :
terraform workspace list
# to swith onto a given workspace :
terraform workspace select dev
# to call a workspace use "${terraform.workspace}"