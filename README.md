# QA_Final_Project_Spring_Petclinic

### Project Brief
We were assigned a group project to deploy via cloud infrastructure: a ready-made application that uses AngularJS and an API that uses Java. 

### Project planning 
We used Github to host our code repository and we decided to use Jira for our project management. We chose this over Trello because it had a feature to integrate with our Github repository for the project and allowed us to assign tasks to individuals, which made our morning standups more efficient.
### Jira
We used Jira as our planning software application for issue tracking and project management, this helped us work within the agile frameworks. We got a good sense of which stage of development the project was at all times and future steps. This also made the delegation of tasks a lot more efficient.

![Screenshot_121](https://user-images.githubusercontent.com/55898620/139315712-d267fa58-9a30-428b-9050-d36b0d455dbf.png)

### Cost estimation
We decided to use a t2.medium instance for the Jenkins server and a t2.medium instance for the kubernetes cluster. The cost of a t2.medium is $0.0464/hour and a kubernetes cluster is $0.10/hour. It was estimated that we would run these resources for approximately 24 hours, a day before the presentation, which was estimated at $5.

### Terraform
We chose to use terraform as a way to manage the entire lifecycle of our infrastructure through the use of infrastructure as code. We declared infrastructure components in configuration files that are then used by Terraform to provide various resources on AWS.  

### Risk assessment 
Our risk assessment shows the possible issues that may occur during the development and deployment of our project. This helps us to minimize any major faults or setbacks during the project:
![Riskassesment](https://user-images.githubusercontent.com/55898620/139305877-a2e76366-a032-4304-ac16-ec574ece55ef.png)


some of the risks and preventative measures we identified were:

* App breaking code getting pushed up to the main branch, the measure for this was to set up reviews for any pushes to git and having a previous version on a branch to revert to if things went go wrong.

* The secret key being uploaded to GitHub, this has a high impact level on the project and could be a data breach, to control this we will have .gitignore and secret keys implemented before pushing to GitHub.

* Applications virtual machine goes down. We can try and restore this by creating a new instance of the virtual machine through the use of terraforming and cloning from the remote repository.

### Docker Implementation
In order to implement the Docker containers for the front end and back end, it was required to utilise the containerisation of docker and produce a container for both the front end (angular web app) and the back end (REST API with in built mysql memory store).

Minor changes needed to be made to the front end in the case of changing the network environment endpoints to instead of pointing at localhost, to point towards the back end (when configured through Nginx) on a cluster.

It was then a simple task of building the docker containers and pushing them to Docker Hub, which provided the CI pipeline with the images required to run the web application successfully.

### Network Diagram
Below is a simple overview of the connectivity between various resources in a singular-deployment scenario.
![Netdia](https://user-images.githubusercontent.com/33896164/139346043-31d2341b-2c29-41bd-ab2a-cee2b292d23c.png)

### Kubernetes and Jenkins 
For the CI/CD pipeline a Jenkins build server was provisioned and a Jenkinsfile was written to encompass the following steps:
Pulling of the GitHub respository for changes
Building the Docker image of the app
Logging into Docker Hub and pushing the newly created image.
Configuring the AWS EKS cluster with the newly created clustername
Deploying the application on kubernetes using kubectl

This code is shown here:

![deploy](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/Jenkinsfile.png)

A successful deployment:

![deployment](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/jenkins.png)

Kubectl get services in the Jenkins terminal showing the frontend, backend and nginx manifests:

![kubectl](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/kubectl.png)

And finally the running app on the cluster:

![app](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/Working%20App.png)

### Security
To maintain strict and specific resource access on our AWS infrastructure, IAM roles and groups were implemented on the primary account. Each member of the team was assigned to a group containing only the necessary policies to deploy the resources required to run the application.

###  Future Improvements 
* work on our weakest areas
* Incorporate backend of the app on a RDS


