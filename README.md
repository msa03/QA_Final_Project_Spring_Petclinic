# QA_Final_Project_Spring_Petclinic

### Poject planning 
## Created a single-source GitHub repository for source control and to allow for continuous integration.
## AWS intergration
### Created AWS IAM roles on primary account.
### A group containing two policies with limited permissions for security.
### Creation of 4 users with the same group to ensure access is only granted for necessary resources.
###    ⦿ AmazonEC2ContainerRegistryFullAccess
###      This policy provides administrative access to Amazon ECR resources.
###	⦿ AmazonEKSClusterPolicy
###      This policy provides Kubernetes the permissions it requires to manage resources on your behalf.

### Cost estimation
We decided to use a t2.medium instance for the Jenkins server and a t2.medium instance for the kubernetes cluster. The cost of a t2.medium is $0.0464/hour and a kubernetes cluster is $0.10/hour. It was estimated that we would run these resources for approximately 24 hours, a day before the presentation, which was estimated at $5.
### Terraform

### Risk assessment 

### Docker implementation

### Network diagram 

### Kubernetes implementation 

###  Jenkins 