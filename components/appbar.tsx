import React from "react";
import {
  createStyles,
  makeStyles,
  Theme,
  useTheme,
} from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import MenuIcon from "@material-ui/icons/Menu";
import MenuItem from "@material-ui/core/MenuItem";
import Menu from "@material-ui/core/Menu";
import Link from "next/link";
import Image from "next/image";
import useMediaQuery from "@material-ui/core/useMediaQuery";
import Button from "@material-ui/core/Button";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flexGrow: 1,
    },
    menuButton: {
      marginRight: theme.spacing(2),
    },
    title: {
      [theme.breakpoints.down("xs")]: {
        flexGrow: 1,
      },
    },
  })
);

export default function MenuAppBar() {
  const classes = useStyles();
  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
  const open = Boolean(anchorEl);
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down("xs"));

  const handleMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
    <div className={classes.root}>
      <AppBar position="static" color="default">
        <Toolbar>
          <Image
            src="/lectric_ave_logo_new.svg"
            alt="Lectric Ave"
            width={150}
            height={150}
          />

          {isMobile ? (
            <div>
              <IconButton
                edge="start"
                className={classes.menuButton}
                color="inherit"
                aria-label="menu"
                onClick={handleMenu}
              >
                <MenuIcon />
              </IconButton>
              <Menu
                id="menu-appbar"
                anchorEl={anchorEl}
                anchorOrigin={{
                  vertical: "top",
                  horizontal: "right",
                }}
                keepMounted
                transformOrigin={{
                  vertical: "top",
                  horizontal: "right",
                }}
                open={open}
                onClose={handleClose}
              >
                {/* <Link href="/">
					<MenuItem onClick={handleClose}>Home</MenuItem>
				</Link>
				<Link href="/products">
					<MenuItem onClick={handleClose}>Products</MenuItem>
				</Link> */}
                <MenuItem onClick={handleClose}>Repairs</MenuItem>
                <MenuItem onClick={handleClose}>About us</MenuItem>
                <MenuItem onClick={handleClose}>Contact us</MenuItem>
              </Menu>
            </div>
          ) : (
            <div>
              <Link href="/">
                <Button>Home</Button>
              </Link>
              <Link href="/products">
                <Button>Products</Button>
              </Link>
              <Link href="/repairs">
                <Button>Repairs</Button>
              </Link>
              <Link href="/about-us">
                <Button>About us</Button>
              </Link>
              <Link href="/contact-us">
                <Button>Contact</Button>
              </Link>
            </div>
          )}
        </Toolbar>
      </AppBar>
    </div>
  );
}
