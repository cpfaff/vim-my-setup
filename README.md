# My vim setup

## Manual installation

### Install the dependencies:

```
sudo apt-get install par ruby1.8-dev vim-nox git-core exuberant-ctags
```

### Clone the repository:

```
mv ~/.vim ~/.vim_bck
git clone https://github.com/cpfaff/vim-my-setup.git ~/.vim
```

### Prepare vundle:

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
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

- Go to command-t plugin folder:

```
cd ~/.vim/bundle/Command-T/ruby/command-t/
```

- Execute the extconf.rb:

```
ruby extconf.rb
```

- Execute the the build process:

```
make
```

## Script install 

- Clone into my repository:

```
git clone https://github.com/cpfaff/vim-my-setup.git
```

- Change into the repository folder

```
cd vim-my-setup
```

- Make the install.sh executable:

```
chmod +x install.sh
```

- Execute the script:

```
./install.sh
```

- Wait till it is finished. Then enjoy my-vim-setup!


