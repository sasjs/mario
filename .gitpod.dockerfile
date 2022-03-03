FROM gitpod/workspace-full

RUN sudo apt-get update 
RUN sudo apt-get install -y doxygen 
RUN sudo apt-get install -y graphviz 
RUN sudo rm -rf /var/lib/apt/lists/*
