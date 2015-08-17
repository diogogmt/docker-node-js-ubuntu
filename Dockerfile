FROM diogogmt/ubuntu:14.04.03

ENV NODE_HOME /usr/local/node
ENV NPM_HOME /usr/local/npm

RUN mkdir $NPM_HOME

ENV NODE_VERSION 0.10.38
RUN mkdir $NODE_HOME-$NODE_VERSION \
    && wget http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
    && tar -xvzf node-v$NODE_VERSION-linux-x64.tar.gz \
    && mv node*/* $NODE_HOME-$NODE_VERSION

ENV NODE_VERSION 0.12.3
RUN mkdir $NODE_HOME-$NODE_VERSION \
    && wget http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
    && tar -xvzf node-v$NODE_VERSION-linux-x64.tar.gz \
    && mv node*/* $NODE_HOME-$NODE_VERSION \
    && ln -s $NODE_HOME-$NODE_VERSION $NODE_HOME

ENV PATH $NODE_HOME/bin:$NPM_HOME/bin:$PATH

RUN npm config set prefix $NPM_HOME

RUN npm install -g forever grunt-cli
