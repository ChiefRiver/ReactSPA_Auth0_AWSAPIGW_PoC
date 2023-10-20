import React from "react";
import { useAuth0 } from "@auth0/auth0-react";
import LogoutButton from "./LogoutButton";
import LoginButton from "./LoginButton";



const Profile = () => {
  const { user, isAuthenticated, isLoading } = useAuth0();

  if (isLoading) {
    return <div>Loading ...</div>;
  }
  if (!isAuthenticated) {
    return <div><LoginButton /></div>;
  }



  return (
    isAuthenticated && (
      <div>
       <LogoutButton />
      </div>
    ) 
  );
};

export default Profile;