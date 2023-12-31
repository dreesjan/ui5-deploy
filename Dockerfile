FROM node:18

# Cloud Foundry CLI Installation
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get -y -q update
RUN apt-get -y -q install cf7-cli

# MTA build tool Installation
RUN npm i -g mbt

# Installation of multiapps plugin for deploying the mtar
# RUN cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
# RUN cf install-plugin -r CF-Community "multiapps" -f
RUN wget -q -O /root/multiapps-plugin.linux64 https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/latest/download/multiapps-plugin.linux64 
# RUN cf install-plugin /root/multiapps-plugin.linux64 -f

# Copies the shell script to the container
COPY entrypoint.sh /entrypoint.sh

# File that executes when the container starts up
ENTRYPOINT ["/entrypoint.sh"]