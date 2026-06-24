FROM ubuntu:22.04

################################
# Setting default environment
################################
# prepare default setting for bash
RUN echo '# Setup aliases' >> /root/.bashrc
RUN echo "alias ll='ls -alFh'" >> /root/.bashrc
RUN echo "alias la='ls -Ah'" >> /root/.bashrc
RUN echo "alias l='ls -CFh'" >> /root/.bashrc
RUN echo "alias ..='cd ..'" >> /root/.bashrc
RUN echo '  ' >> /root/.bashrc

################################
# Resolving dependencies
################################
# install jekyll dependency (Ruby and build tools)
RUN apt-get update
RUN apt-get install -y ruby-full build-essential zlib1g-dev

# prepare Gem user directory for RUN
RUN echo '# Install Ruby Gems to ~/gems' >> /root/.bashrc
RUN echo 'export GEM_HOME="/root/gems"' >> /root/.bashrc
RUN echo 'export PATH="/root/gems/bin:$PATH"' >> /root/.bashrc

# prepare Gem user directory for BUILD
ENV GEM_HOME="/root/gems"
ENV PATH="/root/gems/bin:$PATH"


################################
# Install jekyll and bundler
################################
# Install jekyll and bundler
RUN gem install jekyll bundler

# Instead of copying Gemfile and Gemfile.lock, we direcltly call them from this reportory
WORKDIR /root
COPY Gemfile Gemfile.lock /root/

# update dependencies of jekyll for this repository
RUN bundle install


