FROM diogogmt/ubuntu:14.04.03

ENV NODE_HOME /usr/local/node
ENV NODE_VERSION 0.12.7

ENV NPM_HOME /usr/local/npm
RUN mkdir $NPM_HOME

RUN mkdir $NODE_HOME-$NODE_VERSION \
    && wget http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
    && tar -xvzf node-v$NODE_VERSION-linux-x64.tar.gz \
    && mv node*/* $NODE_HOME-$NODE_VERSION

RUN ln -s /usr/local/node-$NODE_VERSION $NODE_HOME

ENV PATH $NODE_HOME/bin:$NPM_HOME/bin:$PATH

RUN npm config set prefix $NPM_HOME

RUN npm install -g forever grunt-cli
