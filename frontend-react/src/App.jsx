import React, { useEffect, useState } from 'react';
import Pagination from '@material-ui/lab/Pagination';
import axios from 'axios'
import Header from './Header'
import SideMenu from './SideMenu'
import Games from './Games'
import './App.css';

const App = () => {
  const [state, setState] = useState([])
  const [page, setPage] = useState(1)
    
  useEffect(() => {
    axios
      .get(`http://localhost:3001/?page=${page}`)
      .then(response => setState(response.data))
  }, [page])

  const handleChange = (event, value) => {
    setPage(value)
  }

  return (
    <div>
      <Header />
      <div id='main'>
        <SideMenu sitesList={state.sites} />
        <Games gamesList={state.games} />
      </div>
      {state.pagy &&
        <Pagination count={state.pagy.pages} onChange={handleChange} showFirstButton showLastButton />
      }
    </div>
  );
}

export default App;