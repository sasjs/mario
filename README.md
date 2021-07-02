# Mario Game for SAS

This is simply a SAS Streamed version of the following repo: https://github.com/sasjs/mario

The aim is to demonstrate the ease with which apps can be streamed in both SAS 9 and Viya.

To build the game, you first need to [install](https://cli.sasjs.io/installation) the SASjs CLI.

Then, update the `defaultTarget` attribute of the `sasjs/sasjsconfig.json` file to either `sas9` or `viya` depending on your available platform.  You should also update the `serverUrl` and `appLoc` attributes of the relevant target, to determine to which server and logical folder you will deploy.

Instructions thereafter:

```bash
git clone https://github.com/sasjs/mario
cd mario
npm i
sasjs auth
sasjs cbd
```

You can then click the link at the bottom of the console to open the game!




