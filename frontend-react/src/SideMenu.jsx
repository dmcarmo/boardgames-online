import React from 'react';
import Checkbox from '@material-ui/core/Checkbox';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import TextField from '@material-ui/core/TextField';

const SideMenu = (props) => {

  return (
    <div id='side-menu'>
      {props.sitesList && props.sitesList.map(item => (
        <FormControlLabel
          key={item.id}
          control={<Checkbox onChange={props.handleFilterChange} name={item.id.toString()} />}
          label={item.name}
        />
      ))}
      <form className="search-box" noValidate autoComplete="off">
      {/* <TextField id="standard-basic" label="Standard" /> */}
      <TextField id="filled-basic" label="Find a game!" variant="filled" onChange={props.handleSearch} value={props.search}/>
      {/* <TextField id="outlined-basic" label="Outlined" variant="outlined" /> */}
      </form>
    </div>
  )
}

export default SideMenu