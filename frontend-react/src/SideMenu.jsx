import React from 'react';
import Checkbox from '@material-ui/core/Checkbox';
import FormControlLabel from '@material-ui/core/FormControlLabel';

const SideMenu = (props) => {
  console.log(props)
  const [state, setState] = React.useState({})
  const handleChange = (event) => {
    setState({ ...state, [event.target.name]: event.target.checked });
  }
  return (
    <div id='side-menu'>
      {props.sitesList && props.sitesList && props.sitesList.map(item => (
        <FormControlLabel
          key={item.id}
          control={<Checkbox checked={state.checkedA} onChange={handleChange} name="checkedA" />}
          label={item.name}
        />
      ))}
    </div>
  )
}

export default SideMenu