import React, { useEffect, useState } from 'react';
import { useAuth0 } from "@auth0/auth0-react";
import Loading from '../Components/Loading';
import { API_BASE_URL } from '../Config/globals';
import './StaticInfo.css'
import { AUDIANCE, CUSTOMSCOPES } from '../Config/globals';


const StaticInfo = () => {
  const [fetchData, setFetchData] = useState(false);
  const { getAccessTokenSilently, isLoading, isAuthenticated } = useAuth0();
  const [info, setInfo] = useState(null);

  useEffect(() => {
    const fetchDataFromAPI = async () => {
      try {
        const token = await getAccessTokenSilently({
          authorizationParams: {
            audience: AUDIANCE,
            scope: CUSTOMSCOPES,
          },
        });
        const response = await fetch(API_BASE_URL+'/static', {
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
          <h3>SUCCESS: You got an Access Token and called your custom API!</h3>
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