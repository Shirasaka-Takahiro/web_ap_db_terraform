■Set-Up
1. Create S3 for tfstate
2. Generate public and private key on local

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
CloudWatch
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

■Directories and files
.
├── README.md
├── env
│   ├── dev
│   │   ├── common
│   │   │   ├── backend.tf
│   │   │   ├── key_pair.tf
│   │   │   ├── network.tf
│   │   │   ├── outputs.tf
│   │   │   ├── securitygroup.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── variables.tf
│   │   ├── domain
│   │   │   ├── backend.tf
│   │   │   ├── domain.tf
│   │   │   ├── outputs.tf
│   │   │   ├── remote_state.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── variables.tf
│   │   └── resource
│   │       ├── ap.tf
│   │       ├── backend.tf
│   │       ├── db.tf
│   │       ├── outputs.tf
│   │       ├── remote_state.tf
│   │       ├── terraform.tfvars
│   │       ├── variables.tf
│   │       └── web.tf
│   └── stg
└── module
    ├── ap
    │   ├── cloudwatch.tf
    │   ├── ec2.tf
    │   ├── outputs.tf
    │   ├── sns.tf
    │   └── variables.tf
    ├── common
    │   ├── key_pair
    │   │   ├── key_pair.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── network
    │   │   ├── network.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── securitygroup
    │       ├── outputs.tf
    │       ├── securitygroup.tf
    │       └── variables.tf
    ├── db
    │   ├── cloudwatch.tf
    │   ├── outputs.tf
    │   ├── rds.tf
    │   ├── sns.tf
    │   └── variables.tf
    ├── domain
    │   ├── acm
    │   │   ├── acm.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── route53
    │       ├── outputs.tf
    │       ├── route53.tf
    │       └── variables.tf
    └── web
        ├── alb.tf
        ├── cloudwatch.tf
        ├── ec2.tf
        ├── outputs.tf
        ├── sns.tf
        └── variables.tf