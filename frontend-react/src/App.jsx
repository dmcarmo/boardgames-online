import React, { useEffect, useState } from 'react';
import axios from 'axios'
import Header from './Header'
import SideMenu from './SideMenu'
import Games from './Games'
import './App.css';

const App = () => {
  const [state, setState] = useState([])
  useEffect(() => {
    axios
      .get('http://localhost:3001')
      .then(response => setState(response.data))
  }, [])

  return (
    <div>
      <Header />
      <div id='main'>
        <SideMenu sitesList={state.sites} />
        <Games gamesList={state.games} />
      </div>
    </div>
  );
}

export default App;