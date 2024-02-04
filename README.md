

# Github Webpage


## Local Test Environment
* I made the test environment using vagrant
* Prerequisite: VirtualBox and vagrant  (https://developer.hashicorp.com/vagrant/docs/installation)

### Install vagrant box
* Enclosed Vagrantfile has a default configurations (Ubuntu 22.04)
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
* Open a file named `Gemfile` (e.g., `vi Gemfile`)
* Paste the following code
* This code includes jekyll library (gems) and plugins 
* Reference: https://jekyllrb.com/docs/ruby-101/#gems
* Note: in local, Ruby3.x does not include webrick, we need to include it in the Gemfile.
```shell
source "https://rubygems.org"

# gem "jekyll" 
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
gem "github-pages", group: :jekyll_plugins
gem "jekyll-include-cache", group: :jekyll_plugins    # Liquid tag that caches Liquid includes."

# For local test
gem "webrick", "~> 1.8"
```
  


## Install gems and execute jekyll site
```shell
# update dependency of jekyll
bundle install

# execute server
bundle exec jekyll serve

# If you want to make access from outside, you should execute the server with "--host=0.0.0.0"
bundle exec jekyll serve --host=0.0.0.0

# default port also can be changed with "--port=<port num>"
bundle exec jekyll serve --host=0.0.0.0 --port=5000
```



## Additional: install a default jekyll sites
```shell
# install a default jekyll sites (This will generate a sample files)
jekyll new --skip-bundle .

# update 'Gemfile'
# to have the same environment with github-pages
# disable the following lines
gem "jekyll"
# activate the following line with GITHUB-PAGES-VERSION(see the versions:https://pages.github.com/versions/) 
gem "github-pages", "~> GITHUB-PAGES-VERSION", group: :jekyll_plugins

# Add bundle "webrick"
#   - since github-pages still working with Ruby 2.7...they are including webrick
#   - but ruby 3.x does not come with it. (Ruby 2.7 is not supported now...so..we need to add it)
#   - we can install it in the command line
bundle add webrick
#   - or we can add a line in the Gemfile 
gem "webrick", "~> 1.8"


# update the bundle github-pages 
bundle update github-pages

# test executing 
bundle exec jekyll serve --host=0.0.0.0
``` 




## Configure web site
* Reference
  * https://jekyllrb.com/docs/configuration/
###
* Make a file `_config.yml` or `_config.toml` at the root directory
```shell

```







## References
* Github Pages: https://docs.github.com/en/pages/quickstart
* Github Pages - jekyll: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll
* Local Test - Guideline: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll
* Local Test - Install jekyll: https://jekyllrb.com/docs/installation/ubuntu/