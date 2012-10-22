My Vim setup
============

This is my personal Vim setup. It can be installed manually or
with the help of a bash installer script. Both installation
methods are described in detail below. The setup uses the
[NeoBundle](https://github.com/Shougo/neobundle.vim.git) package manager to
handle all the included plug-ins. For a full list of installed Vim plug-ins
please have a look into the `bundles.vim` file.

Note: This setup is only tested on a Linux machine in a terminal Vim but should
usually work also well on G-Vim.

Script install 
---------------

The easiest way to get this Vim distribution up an running is to use the bash
installer.

### With Curl

If you have curl installed on your machine you can simply use the command below
for installation. It scrapes the install script from this GitHub page and pipes
the output into bash.

```
curl https://raw.github.com/cpfaff/vim-my-setup/master/install.sh | bash
```

### Without Curl

#### Clone into my repository:

```
git clone https://github.com/cpfaff/vim-my-setup.git
```

#### Change to repository folder:

```
cd vim-my-setup
```

#### Make the install.sh executable:

```
chmod +x install.sh
```

#### Execute the script:

```
./install.sh
```

Wait till it is finished. Then enjoy my-vim-setup!

## Manual installation

### Install the dependencies:

Note: These are package names from Ubuntu 12.04 sources.

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
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
```

### Link the .vimrc:

```
mv ~/.vimrc ~/.vimrc_bck
ln -s ~/.vim/vimrc ~/.vimrc
```

### Install the bundles:

1. Open Vim `vim`
2. Type `:NeoBundleInstall`
