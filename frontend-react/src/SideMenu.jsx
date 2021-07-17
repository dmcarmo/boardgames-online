import React from 'react';
import Checkbox from '@material-ui/core/Checkbox';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import TextField from '@material-ui/core/TextField';

const SideMenu = (props) => {

  return (
    <div id='side-menu'>
      <form className="search-box" noValidate autoComplete="off">
        <TextField id="filled-basic" label="Find a game!" variant="filled" onChange={props.handleSearch} value={props.search}/>
      </form>
      {props.sitesList && props.sitesList.map(item => (
        <FormControlLabel
          key={item.id}
          control={<Checkbox onChange={props.handleFilterChange} name={item.id.toString()} />}
          label={item.name}
        />
      ))}
    </div>
  )
}

export default SideMenu