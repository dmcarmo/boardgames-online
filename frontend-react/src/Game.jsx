import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    maxWidth: 240,
    backgroundColor: 'white',
    borderRadius: 8,
    margin: 10,
    textAlign: 'center',
  },
  media: {
    height: 140,
    width: 240,
  }
});

const Game = (props) => {
  const classes = useStyles();
  return (
    <Card className={classes.root}>
      <CardActionArea>
        <CardMedia
          className={classes.media}
          image="/static/images/cards/contemplative-reptile.jpg"
          title={props.gameInfo.name}
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            {props.gameInfo.name}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Button size="small" color="primary">
          Sites
        </Button>
      </CardActions>
    </Card>
  )
}

export default Game
