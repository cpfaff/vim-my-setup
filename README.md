# My vim setup

## Install

### Install all dependencies:

```
sudo apt-get install par ruby1.8-dev vim-nox git-core exuberant-ctags
```

Clone into the repository:

```
cd
git clone https://github.com/cpfaff/vim-my-config.git
```

### Link the bashrc file:

```
ln -s ~/.vim
```

### Install the bundles:

1. Open Vim
2. Type `:BundleInstall`

### Build the command-t plugin:

Note:

To use the command-t plugin vim must be build with ruby support. To build
properly the same ruby version vim is linked against must be used! If you
use rvm try: `rmv use system` if compilation does not work.

1. Go to: `~/.vim/bundle/Command-T/ruby/command-t/`

```
cd ~/.vim/bundle/Command-T/ruby/command-t/
```

2. Execute the extconf.rb

```
cd ~/.vim/bundle/Command-T/ruby/command-t/
```

3. Execute the the build process

```
make
```






