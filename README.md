# My vim setup

## Install

### Install the dependencies:

```
sudo apt-get install par ruby1.8-dev vim-nox git-core exuberant-ctags
```

### Clone the repository:

```
mv ~/.vim ~/.vim_bck
git clone https://github.com/cpfaff/vim-my-config.git ~/.vim
```

### Link the bashrc:

```
mv ~/.vimrc ~/.vimrc_bck
ln -s ~/.vim/vimrc ~/.vimrc
```

### Install the bundles:

1. Open Vim
2. Type `:BundleInstall`

### Build the command-t plugin:

Note:

To use the command-t plugin vim must be build with ruby support. The command-t
plugin requires the same version vim is linked against to work properly! If you
use rvm for ruby version control try: `rmv use system` before executing the
steps below.

1. Go to command-t plugin folder:

```
cd ~/.vim/bundle/Command-T/ruby/command-t/
```

2. Execute the extconf.rb

```
ruby extconf.rb
```

3. Execute the the build process

```
make
```






