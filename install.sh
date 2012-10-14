#!/bin/bash

# ruby version
ruby_version=1.9.3


# Install the dependencies
sudo apt-get install par ruby1.8-dev vim-nox git-core exuberant-ctags

# Backup the existing vim folder  
mv ~/.vim ~/.vim_bck

# Clone into my repository
git clone https://github.com/cpfaff/vim-my-config.git ~/.vim

# Backup the existing vimrc
mv ~/.vimrc ~/.vimrc_bck

# Symbolic link the vimrc file
ln -s ~/.vim/vimrc ~/.vimrc

# Install the Bundles
vim -c :BundleInstall -c :q :q

# Ensure system ruby
if which rvm 
then
	rvm use system
fi

# Go to the comand-t build folder
pushd ~/.vim/bundle/Command-T/ruby/command-t/
	# Execute the extconf.rb file
	ruby extconf.rb
	make
popd

# Reset ruby version
if which rvm 
then
	rvm use ${ruby_version} 
fi

echo "Vim setup ready!"

exit 0



