
<h2>Overview</h2>
  PoC to demonstrate utilizing Auth0 to perfrom Authentication to a Single Page Application (React) as well as send API Calls to a resource (AWS API GW / Lambda / Node.js) which performs authorization via an Access Token (JWT)

<h2>Repo Components</h2>

* Infrastructure
    * Terraform to deploy AWS REST based APIGW with JWT Authorization
    * Terraform to deply Auth0 Client and Authorization Server
* API
    * Simple Node.js running on Lambda to return a json object
* FrontEnd
    * React SPA to perform authentication (OIDC) and then pull an access token from Auth0 Authorization server to send to the above AWS API GW

<h2>Diagram</h2>

![alt text](./Images/Auth0_Diagram.png?raw=true)

<h2>How to Setup</h2>

* Dependencies 
    * Terraform
    * Node
    * AWS Account
    * Auth0 Developer Account

* Deploy Infra
    * Ensure you have credentials set
        * For AWS Account
        * For Auth0 Account 
            * Setup a "machine to machine application" and provide all permissions to this Application to allow for TF deployment
    * Init and apply the AWS & Auth0 infrastructure
        ```
        cd ./Infra/main
        terrafrom init && terraform apply
        ```
    * Required TF Outputs for Configuring Front End
        * API GW Base URL
        * Auth0 Client ID
            * Run the following command:
            ```
            terraform output Auth0_InfraOutputs
            ```
* Deploy Front End
    * cd to Frontend/src/Config and edit globals.js
    * Update all global config vars
    ```
        API_BASE_URL = the above output from terrafrom with your deployed AWS API GW (e.g. )
        DOMAIN = Base domain of your Auth0 Application (e.g. 'dev-nfmgw5fwvjeau2ay.us.auth0.com')
        CLIENTID = Client ID of your Auth0 Application (e.g. 'b3XxmjcJM1ZYM1S5I0W2CUGAg93IvgSM')
        AUDIANCE =  Audiance value of your Auth0 Application (e.g. 'http://blah.com')
        SCOPE = Set scopes for OIDC and any custom "Permissions" of you Auth0 API (e.g. 'openid profile email read:info')
    ```
    ```
    cd ./Frontend && npm install
    npm run start
    ```


