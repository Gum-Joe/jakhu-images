FROM jakhu/base:latest
# Builds nodejs image
MAINTAINER Gum-Joe "kishansambhi@hotmail.co.uk"
# Override ENV
ENV JAKHU_WORKER_VERSION 1.0.0
ENV JAKHU_WORKER_NAME jakhu-docker-ubuntu-nodejs
ENV JAKHU_OS_IMAGE ubuntu
ENV JAKHU_OS_IMAGE_TAG latest
ENV JAKHU_DOCKER_IMAGE nodejs
# Install common nodejs tools - LTS
RUN source /home/jakhu/.nvm/nvm.sh && nvm use v4.2.4 && npm install -g \
    browserify \
    bower \
    express-generator \
    jake \
    grunt-cli \
    gulp-cli \
    mocha \
    istanbul \
    nodemon
# Install common nodejs tools - 0.10.41
RUN source /home/jakhu/.nvm/nvm.sh && nvm use v0.10.41 && npm install -g \
    browserify \
    bower \
    express-generator \
    jake \
    grunt-cli \
    gulp-cli \
    mocha \
    istanbul \
    nodemon
# Install common nodejs tools
RUN source /home/jakhu/.nvm/nvm.sh && nvm use default && npm install -g \
    browserify \
    bower \
    express-generator \
    jake \
    grunt-cli \
    gulp-cli \
    mocha \
    istanbul \
    nodemon
# Re-generate versioning
# Pull images list
RUN sudo chown -R jakhu /jakhuImages; cd /jakhuImages && git pull
VOLUME /jakhuImages
# Create version
RUN sudo chown -R jakhu /metadata
COPY . /jakhutools
RUN /bin/bash -l -c "source ~/.rvm/scripts/rvm && rvm use $RUBY_VERSION && ruby /jakhutools/versions.rb"
RUN chmod 700 /metadata/version.sh
RUN chmod 777 /metadata/version.sh
RUN sudo chmod 700 /jakhutools/info.sh
RUN sudo chmod 777 /jakhutools/info.sh
VOLUME /jakhutools
CMD /jakhutools/info.sh
