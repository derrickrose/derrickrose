#### Note

we can import terraform existing (running) resources in our current tfstate :

* create the same resource in our tf file
* run command : `terraform import ressourcetype.resource_name id-of-the resource`
* example : `terraform import aws_s3_bucket.s3_bucket_importing dev-izybe-tf-training-2`
* !!!! not forget to run `terraform init` before importing

### terraform -update-only
ter