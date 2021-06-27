# Vanilla JavaScript Seed App for SASjs

This is the minimal seed app for [SASjs](https://github.com/sasjs/adapter).

It runs on both SAS 9 and Viya. To deploy the services, execute the following:

```sas
/* define the app location, eg in metadata or Viya folders service */
%let apploc=/Public/app/minimal-seed-app;

/* include macros directly, else download & compile manually */
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
%inc mc;

/* create the two services */
filename ft15f001 temp;
parmcards4;
    proc sql;
    create table areas as select distinct area from sashelp.springs;
    %webout(OPEN)
    %webout(OBJ,areas)
    %webout(CLOSE)
;;;;
%mp_createwebservice(path=&apploc/services/common, name=appinit)

parmcards4;
    %webout(FETCH)
    proc sql;
    create table springs as select * from sashelp.springs
      where area in (select area from areas);
    %webout(OPEN)
    %webout(OBJ,springs)
    %webout(CLOSE)
;;;;
%mp_createwebservice(path=&apploc/services/common, name=getdata)
```

Next, open the `src/index.html` file and update the `appLoc` in the `initSasJs()` function to the same folder location used above. Deploy to the SAS Web Server is recommended using the deploy NPM script provided in the `package.json` file.

It deploys the app to a specified server via SSH using the rsync command. Note - this is not available by default on Windows.  A guide for installing it is available [here](https://sasjs.io/windows/#rsync).

To be able to run the deploy script, two environment variables need to be set:

`SSH_ACCOUNT` - your SSH account, this is of the form username@domain.com
`DEPLOY_PATH` - the path on the server where the app will be deployed to, typically `/var/www/html/<some-subfolder>`.

You can run the script like so:

```bash
SSH_ACCOUNT=me@my-sas-server.com
DEPLOY_PATH=/var/www/html/$(whoami)/minimal
npm run deploy
```

You are done!

## Local Development

You can put the frontend [directly on the SAS Web Server](https://sasjs.io/frontend/deployment/), else you can also use node to spin up a local web server with CORS disabled. To install, submit `npm install http-server -g`. To execute, navigate to the location where the app is to be loaded and submit: `npx http-server --cors`

