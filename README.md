

# Github Webpage
Github webpage is for web service from the git repository directly. It suppurts Jekyll library, where building website from Markdown files.
Once pushing a repository into Github repository named `<username>.github.io`, Github automatically resolve the dependencies and compile websites.
This `README` provides a simple guideline for testing webpage with Jekyll in your local machine. 

## Local Test Environment
* The test environment is made on Vagrant
* Prerequisite: VirtualBox and vagrant  (https://developer.hashicorp.com/vagrant/docs/installation)

### Install vagrant box
* Enclosed Vagrantfile in this repository has a default configurations with Ubuntu 22.04
```shell
vagrant up
vagrant ssh
```

### Install Jekyll
```shell
# install jekyll dependency (Ruby and build tools)
sudo apt update
sudo apt-get install -y ruby-full build-essential zlib1g-dev

# prepare Gem user directory 
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install jekyll and bundler 
gem install jekyll bundler

## References: https://jekyllrb.com/docs/installation/ubuntu/
```

### Move to the working directory
```shell
cd /vagrant     # This directory is the default shared directory
```



## Build your site for Github Pages
### make `Gemfile`
* Create a file named `Gemfile` (e.g., `vi Gemfile`)
* Paste the following code
* This code includes jekyll library and plugins  (gems) 
* Reference: https://jekyllrb.com/docs/ruby-101/#gems
* Note: in local, Ruby3.x does not include `webrick`, we need to include it in the Gemfile.
```shell
source "https://rubygems.org"

# gem "jekyll" 
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
gem "github-pages", group: :jekyll_plugins
gem "jekyll-include-cache", group: :jekyll_plugins    # Liquid tag that caches Liquid includes."

# For local test (It should not included when you push the repository to the github)
gem "webrick", "~> 1.8"
```
  


## Install gems and execute jekyll site
```shell
# update dependencies of jekyll for this repository
bundle install

# execute web server
bundle exec jekyll serve

# If you want to access the website from outside (Host machine), you should execute the server with "--host=0.0.0.0"
bundle exec jekyll serve --host=0.0.0.0

# default port also can be changed with "--port=<port num>"
bundle exec jekyll serve --host=0.0.0.0 --port=5000
```



## Additional: install a default jekyll sites
```shell
# install a default jekyll sites (This will generate a sample files)
jekyll new --skip-bundle .

# Add bundle "webrick"
#   - since github-pages still working with Ruby 2.7...they are including webrick
#   - but ruby 3.x does not come with it. (Ruby 2.7 is not supported now...so..we need to add it)
#   - we can install it in the command line
#   - this command will update 'Gemfile' by adding the following: gem "webrick", "~> 1.8"
bundle add webrick

# update 'Gemfile'
# to have the same environment with github-pages
vi Gemfile
# disable the following line
#     gem "jekyll"
# and activate the following line with GITHUB-PAGES-VERSION(see the versions:https://pages.github.com/versions/) 
#     gem "github-pages", "~> GITHUB-PAGES-VERSION", group: :jekyll_plugins

# update the bundle github-pages 
bundle update github-pages

# test executing 
bundle exec jekyll serve --host=0.0.0.0
``` 




## Create your own web site
* Make a file `_config.yml` or `_config.toml` at the root directory
* Add configurations for your web site
* Add contents (*.md files)
* Modify default theme if it is necessary


## References
* Github Pages: https://docs.github.com/en/pages/quickstart
* Github Pages - jekyll: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll
* Local Test - Guideline: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll
* Local Test - Install jekyll: https://jekyllrb.com/docs/installation/ubuntu/
* Minimum theme - Manual: https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/
* Academic Page theme : https://github.com/academicpages/academicpages.github.io
* Jekyll configurations: https://jekyllrb.com/docs/configuration/