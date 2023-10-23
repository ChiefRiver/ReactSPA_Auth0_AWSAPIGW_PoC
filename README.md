<h1>This contains the following Components</h1>
* Infra - Terraform to deploy and REST based APIGW with JWT Authorization
* APIs - Simple Node.js Lambda Code to return a json object
* FrontEnd - a React app to perform authentication (OIDC) and then pull an access token from an auth server to send to the above infrastructure
* TODO - Auth0 IaC - Right now Auth0 was setup via click ops. Need to move to IaC to complete this PoC repo

<h1>How to Setup</h1>

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


