# DevOps CI/CD example

- using GitHub Actions
- automatic deploy using Watchtower

Watchtower checks for updated images every five seconds. After the GitHub Action has completed and
pushed its image to the registry sucessfully, the webserver is terminated by watchtower and
redeployed using the newly pushed image.

## Flow

push to main
-triggers->
github action
-pushes->
docker image using dockerfile in repository to registry
->
watchtower
-checks->
new image detected in registry
-> redeploy using new image

# Registry UI

[Public Argon Registry](https://ui-public-registry.amtmann.de/)

[dhbwdevops image](https://ui-public-registry.amtmann.de/#!/taghistory/image/dhbwdevops/tag/latest)

# Azure Container Deployments

[Pauer](https://tinf20cdevops.azurewebsites.net/)

[Amtmann](https://dhbw-devops.azurewebsites.net/)

# Using terraform

- Download [terraform cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
- Use documentation [here](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build).

# Work Distribution

- Vorlesung 2 (Docker & Compose) by Amtmann
- Vorlesung 3 (Vagrant) by Plaschko
- Vorlesung 4 (Ansible) by Plaschko
- Vorlesung 5 (Azure App Service) by does not count
- Vorlesung 6 (Terraform) by Pauer & Plaschko
- Vorlesung 7 (Integrationstests) by Amtmann
- Vorlesung 7 (SonarQube) by TODO
- Vorlesung 8 (GitHub Action CI & CD to Azure App Service, private server) by Amtmann
- Vorlesung 9 (Prometheus) by Pauer
