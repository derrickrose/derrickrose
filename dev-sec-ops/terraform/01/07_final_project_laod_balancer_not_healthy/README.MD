### preparation to get started

* using the acloud profile so first update stored access and secret keys
  `aws configure --profile dev-acloud`
* note that we can call values from data inside locals but nor inside variables

### in this project we create:

* 2 sg using default vpc and subnets

### what we did:

* we gave access to a security group to another security group
* created a launch configuration
* created an autoscaling group
* note availability zone for auto-scaling and load-balancer should be the same
* update particular path for health check on target group
