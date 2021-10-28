# QA_Final_Project_Spring_Petclinic

## Poject planning 
#### Created a single-source GitHub repository for source control and to allow for continuous integration.
## AWS intergration
#### Created AWS IAM roles on primary account.
#### A group containing two policies with limited permissions for security.
#### Creation of 4 users with the same group to ensure access is only granted for necessary resources.
###    ⦿ AmazonEC2ContainerRegistryFullAccess
###      This policy provides administrative access to Amazon ECR resources.
###	⦿ AmazonEKSClusterPolicy
###      This policy provides Kubernetes the permissions it requires to manage resources on your behalf.

### Cost estimation
We decided to use a t2.medium instance for the Jenkins server and a t2.medium instance for the kubernetes cluster. The cost of a t2.medium is $0.0464/hour and a kubernetes cluster is $0.10/hour. It was estimated that we would run these resources for approximately 24 hours, a day before the presentation, which was estimated at $5.
### Terraform
We chose to use terraform as a way to manage the entire lifecylce of our infrastructure using infrastructure as code. We declared infrastructure components in configuration files that are then used by Terraform to provision various infrastructure in AWS in this case. 
#### Challenges

###  Project Pipeline

### Risk assessment 
Our risk assessment shows the possible risk that may occur during the development of our project. This helps us to minimize any major faults or setbacks during the project:
![Riskassesment])(Doc_images\Screenshot_122.png) 
some fo the risks and measures we identifed was:

* App breaking code getting pushed up to the main branch, the measure for this was to double-check all code is working accordingly and having a backup file somewhere to revert to if things do go wrong.

* The secret key being uploaded to GitHub, this has a high impact level on the project and could be a data breach, to control this I will have gitignore and secret keys implemented before pushing to git hub

* App Virtual machine goes down, We can try and restore this by creating a new instance of the virtual machine and cloning from Github

### Docker implementation

### Network diagram 

### Kubernetes implementation 

###  Jenkins 

### Secruity
We used IAM roles to delegate access with defined permissions to trusted entities, which was the rest of our group. This ensured only the account owner could do certain tasks.

###  Acknowledgments

###  Future Improvements 