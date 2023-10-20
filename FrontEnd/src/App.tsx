import React from 'react';
import {BrowserRouter as Router, Route, Routes} from "react-router-dom";
import { Container } from "reactstrap";
import { useAuth0 } from "@auth0/auth0-react";

import Loading from './Components/Loading';
import Navbar from './Components/Navbar';
import Home from './Views/Home';

import './App.css';



function App() {
  const { isLoading, error } = useAuth0();

  if (error) {
    return <div>Oops... {error.message}</div>;
  }

  if (isLoading) {
    return <Loading />;
  }

  return (
    <Router>
        <div id="app" >
          <Navbar />
          <Container>
            <Routes>
              <Route path="/" element={<Home />} />
            </Routes>
          </Container>
        </div>
      </Router>
  );
}

export default App;
