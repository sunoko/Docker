home='/home/vagrant'
######################
# general
######################
apt-get -y update
# GCC4.9
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt-get -y update
# Kernel
apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual

######################
# rbenv
######################
# rbenv
git clone https://github.com/rbenv/rbenv.git ${home}/.rbenv
# .bashrcに追記
echo "export PATH=\"${home}/.rbenv/bin:$PATH\"" >> ${home}/.bash_profile
echo 'eval "$(rbenv init -)"' >> ${home}/.bash_profile
# ruby-build
git clone https://github.com/rbenv/ruby-build.git "${home}/.rbenv/plugins/ruby-build"