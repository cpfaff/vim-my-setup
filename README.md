# My Vim setup

This is my personal Vim setup. It can be installed manual or with an installer
bash script. Both methods are described in detail below.

## Manual installation

### Install the dependencies:

Note: Package names in Ubuntu 12.04.

```
sudo apt-get install par ruby1.8-dev vim-nox git-core exuberant-ctags
```

### Clone this repository:

```
mv ~/.vim ~/.vim_bck
git clone https://github.com/cpfaff/vim-my-setup.git ~/.vim
```

### Clone the Vundle repository:

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

### Link the .vimrc:

```
mv ~/.vimrc ~/.vimrc_bck
ln -s ~/.vim/vimrc ~/.vimrc
```

### Install the bundles:

1. Open Vim `vim`
2. Type `:BundleInstall`

### Build the command-t plugin:

Note:

To use the command-t plug-in Vim must be build with ruby support. The command-t
plug-in requires the same version Vim is linked against to compile and work
properly! If you use the ruby version manager (rvm) issue `rmv use system`
before executing the steps below. You can switch back to the ruby version which
you use normally with: `rvm use [version number]` after compilation.

- Go to command-t plug-in folder:

```
cd ~/.vim/bundle/Command-T/ruby/command-t/
```

- Execute the extconf.rb:

```
ruby extconf.rb
```

- Execute the build process:

```
make
```

## Script install 

### Clone into my repository:

```
git clone https://github.com/cpfaff/vim-my-setup.git
```

### Change to repository folder:

```
cd vim-my-setup
```

### Make the install.sh executable:

```
chmod +x install.sh
```

### Set ruby version:

Note: 

The next step is for ruby version manager users only. You need to edit the
script and set the ruby version you normally use. You can set this in set this
in the variable `ruby_version` as shown in the example below.

- Open the installer:

```
vim vim-my-setup/installer/install.sh
```

- Set the variable to your needs:

```
ruby_version="1.9.3"
```

### Execute the script:

```
./install.sh
```

Wait till it is finished. Then enjoy my-vim-setup!


