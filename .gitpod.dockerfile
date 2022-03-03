FROM gitpod/workspace-full

RUN sudo apt-get update 
RUN sudo apt-get install -y doxygen 
RUN sudo rm -rf /var/lib/apt/lists/*
RUN nvm install --lts
RUN npm i -g @sasjs/cli