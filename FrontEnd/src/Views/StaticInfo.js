import React, { useEffect, useState } from 'react';
import { useAuth0 } from "@auth0/auth0-react";
import Loading from '../Components/Loading';
import './StaticInfo.css'


const StaticInfo = () => {
  const [fetchData, setFetchData] = useState(false);
  const { getAccessTokenSilently, isLoading, isAuthenticated } = useAuth0();
  const [info, setInfo] = useState(null);

  useEffect(() => {
    const fetchDataFromAPI = async () => {
      try {
        const token = await getAccessTokenSilently({
          authorizationParams: {
            audience: 'http://blah.com',
            scope: 'read:info',
          },
        });
        const response = await fetch('https://l91lozyyc9.execute-api.us-east-1.amazonaws.com/v1/static', {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        const data = await response.json();
        console.log('Response Data:', data);
        setInfo(data);
      } catch (error) {
        // Handle errors such as `login_required` and `consent_required` by re-prompting for a login
        console.error(error);
      }
    };

    if (fetchData && isAuthenticated) {
      fetchDataFromAPI();
    }
  }, [getAccessTokenSilently, fetchData, isAuthenticated]);

  if (isLoading) {
    return <div><Loading /></div>;
  }

  return (
    <div>
      <p>Use the button below to get an access token and call your custom API</p>
      <button onClick={() => setFetchData(true)}>Fetch Data</button>

      {info ? (
        <div>
          <h3>You got an Access Token and called your custom API!</h3>
          {info.data.map((i, index) => (
            <ul key={index} id={`list${index + 1}`}>
              <li>{i.message}</li>
            </ul>
          ))}
        </div>
      ) : (
        <p>{isAuthenticated ? 'No data available.' : 'Not logged in'}</p>
      )}
    </div>
  );
};

export default StaticInfo;