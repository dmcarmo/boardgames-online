import React, { useEffect, useState } from 'react';
import Pagination from '@material-ui/lab/Pagination';
import axios from 'axios'
import Header from './Header'
import SideMenu from './SideMenu'
import Games from './Games'
import Typography from '@material-ui/core/Typography';
import './App.css';

const App = () => {
  const [state, setState] = useState([])
  const [page, setPage] = useState(1)
  const [filters, setFilters] = useState({})
  const [sites, setSites] = useState([])
  const [search, setSearch] = useState("")

  const handleFilterChange = (event) => {
    const eventChange = { ...filters, [event.target.name] : event.target.checked }
    setFilters(eventChange)
    setSites(Object.keys(eventChange).filter((item) => {
      return eventChange[item] === true
    }))
  }

  useEffect(() => {
    axios
      .get(`/api/games/?page=${page}`, {
        params: {
          site: sites,
          search: [search]
        }
      })
      .then(response => setState(response.data))
  }, [page, search, sites])

  const handlePageChange = (event, value) => {
    setPage(value)
  }

  const handleSearch = event => {
    setSearch(event.target.value)
  }

  return (
    <div id='root-app'>
      <Header />
      <div id='title'>
        <Typography variant="h4" component="h2" gutterBottom >Boardgames Online</Typography>
        <Typography variant="h5" component="h3">If you want to know where your favorite boardgame is available to play online, this page is for you!</Typography>
      </div>
      <div id='main'>
        <SideMenu sitesList={state.sites} handleFilterChange={handleFilterChange} handleSearch={handleSearch} search={search}/>
        <Games gamesList={state.games} />
      </div>
      {state.pagy &&
        <div id="pagination">
          <Typography>{state.pagy.count} games</Typography>
          <Pagination count={state.pagy.pages} onChange={handlePageChange} showFirstButton showLastButton />
        </div>
      }
    </div>
  );
}

export default App;