■Set-Up
1. Create S3 for tfstate

■Resources
<br />
EC2(web,ap)
<br />
RDS
<br />
ALb x 1(HTTP & HTTPS Listener)
<br />
Route53
<br />
ACM
<br />
SNS
<br />
CloudWatch x3
<br />

■Order to apply
1. common(network, securitygroup,key_pair)
2. web without https listener
3. domain
4. web with https listener
5. ap
6. db

■Properties
1. Seperating statefiles to common,domain,monitor and resource
2. Importing several mudule resources from statefiles by using terraform_remote_state