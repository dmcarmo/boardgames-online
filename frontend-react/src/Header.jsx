import React from 'react';
import Button from '@material-ui/core/Button';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import Typography from '@material-ui/core/Typography';

const Header = () => {
  const [anchorEl, setAnchorEl] = React.useState(null);
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  }
  const handleClose = () => {
    setAnchorEl(null);
  }
  return (
    <div id='header'>
      <div>
        <Button>
          <Typography>BoardgameTools</Typography>
        </Button>
      </div>
      {/* <div>
        <Button><Typography>BoardgamesOnline</Typography></Button>
      </div> */}
      <div>
        <Button aria-controls="simple-menu" aria-haspopup="true" onClick={handleClick}>
        <Typography>Menu/Login</Typography>
        </Button>
        <Menu
          id="simple-menu"
          anchorEl={anchorEl}
          keepMounted
          open={Boolean(anchorEl)}
          onClose={handleClose}
        >
          <MenuItem onClick={handleClose}>Sites</MenuItem>
          <MenuItem onClick={handleClose}>Admin</MenuItem>
          <MenuItem onClick={handleClose}>Logout</MenuItem>
        </Menu>
      </div>
    </div>
  )
}

export default Header