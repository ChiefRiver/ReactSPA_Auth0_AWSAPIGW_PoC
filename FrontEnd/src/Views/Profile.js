import React from "react";
import { useAuth0 } from "@auth0/auth0-react";
import StaticInfo from "./StaticInfo";
import Loading from '../Components/Loading';
import './Profile.css'

const Profile = () => {
  const { user, isAuthenticated, isLoading } = useAuth0();
  console.log(user)

  if (isLoading) {
    return <div><Loading /></div>;
  }
  if (!isAuthenticated) {
    return <div>Not logged in</div>;
  }



  return (
    isAuthenticated && (
      <div >
        <h2> Your Authenticated!</h2>
        <h3>ID Token Info for: {user.name} </h3>
        <img src={user.picture} alt={user.name} /> (Rendered Profile Pic)
        <table className="centered-table">
            <thead>
                <tr>
                <th>Token Claim</th>
                <th>Details</th>
                </tr>
            </thead>
            <tbody>
                {Object.keys(user).map(key => (
                <tr key={key}>
                    <td>{key}</td>
                    <td>{user[key]}</td>
                </tr>
                ))}
            </tbody>
        </table>
        <StaticInfo />
      </div>
    ) 
  );
};

export default Profile;