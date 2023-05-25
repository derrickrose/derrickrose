## goal : store static website data in s3 bucket:
Mount data from aws s3 bucket into a container

### step 1 : install awscli

### step 2 : create account on aws

### step 3 : create an access key

### step 4 : configure the access to awscli

### step 5 : create a s3 bucket
Note to create a bucket with ACL access not bucket only access permission
==> frils-aws-bucket 

### step 6 : install s3fs
To install s3fs in order to mount a bucket s3 in local host :
  `sudo apt install s3fs`

### step 7 : create a directory under /mnt
  `sudo mkdir /mnt/website`

### step 8 : create an environment variable with the name of the bucket
  `export BUCKET=frils-aws-bucket`

### step 9 : create a s3fs password file
Password file content should be like *bucketName:accessKeyId:secretAccessKey*, for more details [authentication s3fs](https://manpages.ubuntu.com/manpages/focal/man1/s3fs.1.html)
note : touch to create file and vi to edit file 

### step 8 : mount a s3 bucket content under /mnt/website and allow a cache under /temp
To mount a s3 bucket under a folder on local host :
  `sudo s3fs frils-aws-bucket /mnt/website -o allow_other -o default_acl=public-read -o use_cache=/tmp/s3fs -o passwd_file=${HOME}/.aws/s3fs_pass`

### step 10 : run a container which mount a s3 bucket (from host mount point)
  `docker run -p 80:80 -d --name web_s3 -v /mnt/website:/usr/local/apache2/htdocs:ro httpd:2.4`
  `docker run -d --name web_s3fs -p 80:80 --mount type=bind,source=/mnt/website,target=/usr/local/apache2/htdocs,readonly httpd:2.4`

### Note to unmount we can just use the basic umount command :
* To umount use the following command :  
  `sudo umount /mnt/website` 
* Note that the bucket must be protected using ACL not bucket owner in order to be reachable by others
