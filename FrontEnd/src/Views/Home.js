import { useAuth0 } from "@auth0/auth0-react";
import Profile from "./Profile";
import Loading from '../Components/Loading';


const Home = () => {
    const { user, isAuthenticated, isLoading } = useAuth0();

    if (isLoading) {
      return <div><Loading /></div>;
    }
    if (!isAuthenticated) {
      return <div>Please Login</div>;
    }
  
  
  
    return (
      isAuthenticated && (
        <div>
         <Profile />
        </div>
      ) 
    );
 
};

export default Home;

