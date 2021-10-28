# QA_Final_Project_Spring_Petclinic

## Poject planning 


### Cost estimation
We decided to use a t2.medium instance for the Jenkins server and a t2.medium instance for the kubernetes cluster. The cost of a t2.medium is $0.0464/hour and a kubernetes cluster is $0.10/hour. It was estimated that we would run these resources for approximately 24 hours, a day before the presentation, which was estimated at $5.
### Terraform
We chose to use terraform as a way to manage the entire lifecylce of our infrastructure using infrastructure as code. We declared infrastructure components in configuration files that are then used by Terraform to provision various infrastructure in AWS in this case. 


###  Project Pipeline

### Risk assessment 
Our risk assessment shows the possible risk that may occur during the development of our project. This helps us to minimize any major faults or setbacks during the project:
![Riskassesment](https://user-images.githubusercontent.com/55898620/139305877-a2e76366-a032-4304-ac16-ec574ece55ef.png)


some fo the risks and measures we identifed was:

* App breaking code getting pushed up to the main branch, the measure for this was to double-check all code is working accordingly and having a backup file somewhere to revert to if things do go wrong.

* The secret key being uploaded to GitHub, this has a high impact level on the project and could be a data breach, to control this I will have gitignore and secret keys implemented before pushing to git hub

* App Virtual machine goes down, We can try and restore this by creating a new instance of the virtual machine and cloning from Github

### Docker implementation
In order to implement the Docker containers for the front end and back end, it was required to utilise the containerisation of docker and produce a container for both the front end (angular web app) and the back end (REST API with in built mysql memory store).

small changes needed to be made to the front end in the case of changing the network environment endpoints to instead of pointing at localhost, to point towards the back end (when configured through Nginx) on a cluster.

It was then a simple task of building the docker containers and pushing them to dockerhub, which provided the CI pipeline with the images required to run the web application successfully.

### Network Diagram
[Netdia](https://user-images.githubusercontent.com/33896164/139308812-82eac98e-eb65-4cd5-9628-19d82afaf8d8.png)

###  Kubernetes and Jenkins 
For the CI/CD pipeline a Jenkins build server was provisioned and a Jenkinsfile was written to encompass the following steps:
Polling of the Github respository for changes
Building the Docker image of the app
Logging into DockerHub and pushing the newly created image.
Configuring the aws eks cluster with the newly created clustername
Deploying the application on kubernetes using kubectl

This code is shown here:

![deploy](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/Jenkinsfile.png)

A successful deployment:

![deployment](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/jenkins.png)

Kubectl get services in the jenkins terminal showing the frontend, backend and nginx manifests:

![kubectl](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/kubectl.png)

And finally the running app on the cluster:

![app](https://github.com/msa03/QA_Final_Project_Spring_Petclinic/blob/f5b4aec74335db56e9842d655f570a9affc14ad3/Doc_images/Working%20App.png)

### Secruity
We used IAM roles to delegate access with defined permissions to trusted entities, which was the rest of our group. This ensured only the account owner could do certain tasks.

###  Acknowledgments

###  Future Improvements 
Our initial approach towards this task was to assign each other with the technolgy we are weakest at and  to improve our overall comptenacy and understanding of that technolgy, However due to time lost we was  a day behind and decided to just play to our strenghts because the product would not be at a place we would like it to be otherwise.
