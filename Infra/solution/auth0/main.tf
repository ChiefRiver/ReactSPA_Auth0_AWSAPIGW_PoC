terraform {
  required_providers {
     auth0 = {
      source  = "auth0/auth0"
      version = ">= 1.0.0"
    }
  }
}

resource "auth0_resource_server" "resourceServer" {
  allow_offline_access                            = false
  enforce_policies                                = true
  identifier                                      = "http://testresource.com"
  name                                            = "TestResource"
  signing_alg                                     = "RS256"
  signing_secret                                  = null
  skip_consent_for_verifiable_first_party_clients = true
  token_dialect                                   = "access_token_authz"
  token_lifetime                                  = 86400
  token_lifetime_for_web                          = 7200
  verification_location                           = null
}

resource "auth0_client" "my_app" {
  allowed_clients                       = []
  allowed_logout_urls                   = ["http://localhost:3000"]
  allowed_origins                       = []
  app_type                              = "spa"
  callbacks                             = ["http://localhost:3000"]
  client_aliases                        = []
  client_metadata                       = {}
  cross_origin_auth                     = true
  cross_origin_loc                      = null
  custom_login_page                     = null
  custom_login_page_on                  = true
  description                           = "The Test Application"
  form_template                         = null
  grant_types                           = ["authorization_code", "implicit", "refresh_token"]
  initiate_login_uri                    = null
  is_first_party                        = true
  is_token_endpoint_ip_header_trusted   = false
  logo_uri                              = null
  name                                  = "Test App"
  oidc_conformant                       = true
  organization_require_behavior         = null
  organization_usage                    = null
  sso                                   = false
  sso_disabled                          = false
  web_origins                           = ["http://localhost:3000"]
  jwt_configuration {
    alg                 = "RS256"
    lifetime_in_seconds = 36000
    scopes              = {}
    secret_encoded      = false
  }
  native_social_login {
    apple {
      enabled = false
    }
    facebook {
      enabled = false
    }
  }
  refresh_token {
    expiration_type              = "expiring"
    idle_token_lifetime          = 1296000
    infinite_idle_token_lifetime = false
    infinite_token_lifetime      = false
    leeway                       = 0
    rotation_type                = "rotating"
    token_lifetime               = 2592000
  }
}

resource "auth0_client_credentials" "credential" {
  client_id = auth0_client.my_app.id

  authentication_method = "none"
}

resource "auth0_resource_server_scopes" "my_api_scopes" {
  resource_server_identifier = auth0_resource_server.resourceServer.identifier

  scopes {
    name        = "read:info"
    description = "Read info from AWS API GW"
  }
}