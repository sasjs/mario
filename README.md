# Mario Game for SAS

This is simply a SAS Streamed version of this [repo](https://github.com/reruns/mario) by [Garrett Johnson](https://www.linkedin.com/in/garretttjohnson/).

![](https://sasjs.io/img/mario.png)

The aim is to demonstrate the ease with which apps can be streamed with SAS.

## Installation
The release assets can be found [here](https://github.com/sasjs/mario/releases).  Flavour specific instructions as follows:

* Viya - download the Viya Deployment and run in Studio.  Open the link at the end of the log.
* SAS EBI - download the SAS 9 EBI Deployment, MODIFY THE APPLOC on line 2, then run in Studio or EG.  Open the link at the end of the log.
* [SASjs Server](https://server.sasjs.io) - download the SASjs Streamed App and import the zip file directly to AppStream.

## Build from Source
To build the game, you first need to [install](https://cli.sasjs.io/installation) the SASjs CLI.

Then, update the `defaultTarget` attribute of the `sasjs/sasjsconfig.json` file to either `SAS9` / `VIYA` / `SASJS` depending on your available platform.  You should also update the `serverUrl` and `appLoc` attributes of the relevant target, to determine to which server and logical folder you will deploy.

Instructions thereafter:

```bash
git clone https://github.com/sasjs/mario
cd mario
npm i
sasjs auth
sasjs cbd
```

You can then click the link at the bottom of the console to open the game!




