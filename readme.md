# DevOps CI/CD example

* using GitHub Actions
* automatic deploy using Watchtower

Watchtower checks for updated images every five seconds. After the GitHub Action has completed and 
pushed its image to the registry sucessfully, the webserver is terminated by watchtower and 
redeployed using the newly pushed image. 

## Flow

push to main -triggers-> github action -pushes-> docker image using dockerfile in repository is 
pushed to registry -> 
watchtower -checks-> new image detected in registry -> redeploy using new image 
