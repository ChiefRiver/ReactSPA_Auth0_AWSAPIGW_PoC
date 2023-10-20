This contains the following Components
* Infra - Terraform to deploy and REST based APIGW with JWT Authorization
* APIs - Simple Node.js Lambda Code to return a json object
* FrontEnd - a React app to perform authentication (OIDC) and then pull an access token from an auth server to send to the above infrastructure
* TODO - Auth0 IaC - Right now Auth0 was setup via click ops. Need to move to IaC to complete this PoC repo
