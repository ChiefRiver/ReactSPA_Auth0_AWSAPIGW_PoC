import { useAuth0 } from "@auth0/auth0-react";
import React, { useEffect, useState } from 'react';
import Profile from "./Profile";
import Loading from '../Components/Loading';


const Home = () => {
    const {isAuthenticated, isLoading, loginWithRedirect } = useAuth0();

    useEffect(() => {
      

    }, [isAuthenticated]);
    

  
  
    return (
      <div>
      {isLoading && <p>Loading...</p>}
      {!isLoading && !isAuthenticated && (
          <div>
              <h1>Welcome to the Auth0 PoC</h1>
              <p>Please login to access the content.</p>
      
          </div>
      )}
      {!isLoading && isAuthenticated && <Profile />}
  </div>
    );
 
};

export default Home;

