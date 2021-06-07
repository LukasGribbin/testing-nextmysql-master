import CssBaseline from "@material-ui/core/CssBaseline";
import { ThemeProvider } from "@material-ui/core/styles";
import Head from "next/head";
import theme from "styles/theme";
import MenuAppBar from "../components/appbar";
import { useEffect } from "react";
import { AppProps } from "next/app";

function MyApp({ Component, pageProps }: AppProps) {
  useEffect(() => {
    // Remove the server-side injected CSS.
    // https://dev.to/felixmohr/setting-up-a-blog-with-next-js-react-material-ui-and-typescript-2m6k

    const jssStyles = document.querySelector("#jss-server-side");
    if (jssStyles) {
      jssStyles.parentElement.removeChild(jssStyles);
    }
  }, []);

  return (
    <>
      <Head>
        <title>My App</title>
        <meta
          name="viewport"
          content="minimum-scale=1, initial-scale=1, width=device-width"
        />
      </Head>
      <ThemeProvider theme={theme}>
        <MenuAppBar></MenuAppBar>
        <Component {...pageProps} />
        <CssBaseline />
      </ThemeProvider>
    </>
  );
}

export default MyApp;
