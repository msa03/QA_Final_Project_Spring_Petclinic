# QA_Final_Project_Spring_Petclinic

## Created a single-source GitHub repository for source control and to allow for continuous integration.

## Created AWS IAM roles on primary account.
## A group containing two policies with limited permissions for security.
### Creation of 4 users with the same group to ensure access is only granted for necessary resources.
####    ⦿ AmazonEC2ContainerRegistryFullAccess
#####       This policy provides administrative access to Amazon ECR resources.
####	⦿ AmazonEKSClusterPolicy
#####       This policy provides Kubernetes the permissions it requires to manage resources on your behalf.