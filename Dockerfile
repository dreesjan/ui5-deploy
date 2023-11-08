FROM node:18-bullseye

# Cloud Foundry CLI Installation
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update
RUN apt-get install cf7-cli

# MTA build tool Installation
RUN npm i -g mbt

# Installation of multiapps plugin for deploying the mtar
RUN cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
RUN cf install-plugin multiapps -f

# Copies the shell script to the container
COPY entrypoint.sh /entrypoint.sh

# File that executes when the container starts up
ENTRYPOINT ["/entrypoint.sh"]