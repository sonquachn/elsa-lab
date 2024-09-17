- I use terraform to create AWS infrastructure such as VPC, EKS, ECR. Please see the image CI_CDPipeline.png to know how the CICD works. We can deploy Banzaicloud Vault to store secret and sensitive information, don't have time so don't do here. 
- Jenkins use master-slave architecture and configuration as code. Packer build AMIs for Jenkins slave agent.
- I don't have time to recode the hackathon app so I skip it to deploy.
- Create 3 repos and store hackerthon, configuration-as-code-jenkins-jobdsl, jenkins-share-libraries on Bitbucket.
Build infrastructure and deploy guide
1. Local Environment Setup:
- Terraform and AWS CLI, git, kustomize
- Create AWS IAM user and configure AWS on local 
- Depend on you local setup by yourself
2. Deploy AWS VPC, EKS and related features.
- cd Terraform. Run from 0_remote_state -> 1_ecr -> 2_eks. Read readme.md to know how to run Terraform.
- Run the below command to configure the EKS Cluster
 aws eks update-kubeconfig --region ap-southeast-1 --name elsa-lab-cluster
3. Deploy Cert manager and let's enscrypt
-  cd cert-manager, run the command in the values.yaml file
- run command to configure, insert the real value before run the command. 
kubeclt apply -f clusterissuer-cert-wildcard.yaml
4. Deploy nginx ingress controller
- cd ingress-nginx, modify the values on the values file.
- run the command noted on that file
5. Deploy Jenkins and build AMIs for jenkins agents
- cd configuration-as-code-jenkins, run command 
kubectl kustomize secrets
- run the notes command on the top of file values-elsa-5.1.26.yaml
- run command to apply rbac
- cd jenkins-docker-templates run the command on readme.md 
  kubectl apply -f jenkins-rbac.yml
- setup Jenkins publics URL, point to the aws loadbalancer, ( get this from nginx service)
6. Deploy prometheus stack, Loki stack for monitoring metrics and application logging
cd to prometheus-stack folder and loki-stack foler and run commands that noted in the value files.
7. Deploy prom-msteams to notify MS teams
- cd prom-msteams and add the values in real.
-  run the command noted on value file.
cd templates and run command below to create secret
kubectl apply -f secret.yaml
8. Setup pipeline job
- Go to Jenkins and run super-seed
9. Deploy application
The hackathon foler has docker file in the docker folder, helm chart to deploy application in the helm foler, Jenkins file for the pipeline use to build, push image to ECR and deploy via script store on jenkins-share-libraries.
It auto trigger the code when developer commit and deploy the apps. We also run it manually.
Because we don't use Vault to store secret so run the command to create secret for apps env. Create more secret as require for the apps same way.
kubectl kustomize Secret
10. Use prometheus and loki promtail to monitor application, systems performance and application logs. Can deploy EFK to store logging.

