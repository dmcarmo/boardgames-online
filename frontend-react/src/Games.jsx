import React from 'react';
import Game from './Game'
import { makeStyles } from '@material-ui/core/styles';
import ImageList from '@material-ui/core/ImageList';
// import ImageListItem from '@material-ui/core/ImageListItem';
// import ImageListItemBar from '@material-ui/core/ImageListItemBar';
// import ListSubheader from '@material-ui/core/ListSubheader';
// import IconButton from '@material-ui/core/IconButton';
// import InfoIcon from '@material-ui/icons/Info';

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'space-around',
    overflow: 'hidden',
    // backgroundColor: theme.palette.background.paper,
    backgroundColor: 'transparent',
  },
  imageList: {

  },
  icon: {
    color: 'rgba(255, 255, 255, 0.54)',
  },
}));

const Games = (props) => {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <ImageList rowHeight={180} className={classes.imageList}>
        {/* <ImageListItem key="Subheader" cols={2} style={{ height: 'auto' }}>
          <ListSubheader component="div">Games</ListSubheader>
        </ImageListItem> */}
        {props.gamesList && props.gamesList.map(item => (
          <Game key={item.id} gameInfo={item} />
          // <ImageListItem key={item.id}>
          //   {/* <img src={item.img} alt={item.name} /> */}
          //   <ImageListItemBar
          //     title={item.name}
          //     actionIcon={
          //       <IconButton aria-label={`info about ${item.name}`} className={classes.icon}>
          //         TESTE
          //       </IconButton>
          //     }
          //   />
          // </ImageListItem>
        ))}
      </ImageList>
    </div>
  )
}

export default Games