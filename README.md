<h1>This contains the following Components</h1>

* Infra
    * Terraform to deploy AWS REST based APIGW with JWT Authorization
    * Terraform to deply Auth0 Client and Authorization Server
* APIs
    * Simple Node.js running on Lambda to return a json object
* FrontEnd
    * React SPA to perform authentication (OIDC) and then pull an access token from Auth0 Authorization server to send to the above AWS API GW

<h1>Overview</h1>

![alt text](./Images/Auth0_Diagram.png?raw=true)

<h1>How to Setup</h1>

* Dependencies 
    * Terraform
    * Node
    * AWS Account
    * Auth0 Developer Account

* Deploy Infra
    * Cd Infra/main && Terraform init && Terraform deploy
    * If successful it should ouput your API GW Base URL. Note this down for below step
        * Run the following command to get the clientID for you app 'terraform output Auth0_InfraOutputs'. Note this down for below step
* Deploy Front End
    * cd to Frontend/src/Config and edit globals.js
    * Update all global config vars
        * API_BASE_URL = the above output from terrafrom with your deployed AWS API GW (e.g. )
        * DOMAIN = Base domain of your Auth0 Application (e.g. 'dev-nfmgw5fwvjeau2ay.us.auth0.com')
        * CLIENTID = Client ID of your Auth0 Application (e.g. 'b3XxmjcJM1ZYM1S5I0W2CUGAg93IvgSM')
        * AUDIANCE =  Audiance value of your Auth0 Application (e.g. 'http://blah.com')
        * SCOPE = Set scopes for OIDC and any custom "Permissions" of you Auth0 API (e.g. 'openid profile email read:info')
    * cd to Frontend and npm install
    * npm run start


