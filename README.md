■Set-Up
1. Create S3 for tfstate
ex)example-dev-alb-accesslog-bucket

2. Generate public and private key

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

■Order to apply
1. common(network)
2. web without https listener
3. domain including acm
4. web with https listener

■Directories and files
.
├── README.md
├── env
│   ├── dev
│   │   ├── common
│   │   │   ├── backend.tf
│   │   │   ├── common.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── variables.tf
│   │   ├── domain
│   │   │   ├── backend.tf
│   │   │   ├── domain.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── variables.tf
│   │   └── resource
│   │       ├── ap.tf
│   │       ├── backend.tf
│   │       ├── db.tf
│   │       ├── outputs.tf
│   │       ├── terraform.tfvars
│   │       ├── variables.tf
│   │       └── web.tf
│   └── stg
└── module
    ├── ap
    │   ├── ec2.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── common
    │   ├── network
    │   │   ├── network.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── securitygroup
    │       ├── outputs.tf
    │       ├── securitygroup.tf
    │       └── variables.tf
    ├── db
    │   ├── outputs.tf
    │   ├── rds.tf
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
        ├── ec2.tf
        ├── outputs.tf
        └── variables.tf