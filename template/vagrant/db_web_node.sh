home='/home/vagrant'
#######################
# rails
#######################
sudo apt-get -y install ruby-dev zlib1g-dev gcc make
gem install bundler
gem install pkg-config -v "~> 1.1.7"
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libxslt-dev
gem install nokogiri -- --use-system-libraries
gem install rails --no-ri --no-rdoc 

# #######################
# # postgres
# #######################
# # postgres sqlite3 install
apt-get -y install libpq-dev libsqlite3-dev

# #######################
# # nginx
# #######################
# # nginx install
apt-get -y install nginx

# #######################
# # nodejs
# #######################
# # nodejs npm install
apt-get -y install nodejs npm
npm cache clean
npm install n -g
n stable
ln -sf /usr/local/bin/node /usr/bin/node
apt-get -y purge nodejs npm


#######################
# version
#######################
echo 'node -v' >> "${home}/.bash_profile"
echo 'ruby -v' >> "${home}/.bash_profile"
echo 'rails -v' >> "${home}/.bash_profile"
echo 'docker -v' >> "${home}/.bash_profile"
echo 'docker-compose -v' >> "${home}/.bash_profile"