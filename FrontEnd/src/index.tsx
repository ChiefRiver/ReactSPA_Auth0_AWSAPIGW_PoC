import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import { Auth0Provider } from '@auth0/auth0-react';
import { DOMAIN, CLIENTID, AUDIANCE, OIDCSCOPES, CUSTOMSCOPES } from './Config/globals'

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
<Auth0Provider
    domain= {DOMAIN}
    clientId={CLIENTID}
    authorizationParams={{
      redirect_uri: window.location.origin,
      audience: AUDIANCE,
      responseType: 'token id_token',
      scope: OIDCSCOPES +" "+ CUSTOMSCOPES
    }}
  >
    <App />
  </Auth0Provider>,
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
