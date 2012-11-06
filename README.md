My Vim setup
============

This repository contains my personal Vim setup. It can be installed
manually or with the help of a bash installer script. Both installation
methods are described in detail below. The setup contains a curated
set of plug-ins to play well together. The packages are managed with the package manager
[NeoBundle](https://github.com/Shougo/neobundle.vim.git).

If you find any problems with mappings or plug-ins please let me know about
that. For a full list of installed Vim plug-ins please have a look into the
`bundles.vim` file. For the mappings have a look into the `vimrc` file where all
of them are documented.

Note: 

This setup was tested on a Ubuntu Linux machine, with a non graphical Vim only.
In order to use the full functionality of this Vim setup, you need to install
additional packages to your system. The dependencies are:

- ack-grep  (grep)
- par (format text)
- vim-nox (Vim)
- git-core (Git)
- exuberant-ctags (create tag files)

Script install 
---------------

The bash installer script is the easiest way to setup my Vim configuration. It
installs all required packages with apt-get (Ubuntu 12.10 sources) and all the
plug-ins to extend the Vim functionality with NeoBundleInstall. If you prefer to
use aptitude see the section about how to modify the installer script.

### With wget 

You can use wget to download the installer script. Afterwards you need to make
it executable and start the script to install the setup. If you like you can
modify the script before you start the installation (see the section about
modifying the install script below)

#### Download installer:

```
wget https://raw.github.com/cpfaff/vim-my-setup/master/install.sh 
```

#### Make it executable:

```
chmod +x install.sh
```

#### Start installer:

```
./install.sh
```

### With git 

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

Wait till it is finished. Then enjoy my Vim setup!

## Manual installation

### Install the dependencies:

```
sudo apt-get install par ruby1.8-dev vim-nox git-core exuberant-ctags
```

### Clone this repository:

```
mv ~/.vim ~/.vim_bck
git clone https://github.com/cpfaff/vim-my-setup.git ~/.vim
```

### Clone the NeoBundle repository:

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

## Modify my vim setup 

My setup uses the Solarized color scheme as standard.
It is recommended to set also your terminal colors to
[Solarized](https://github.com/altercation/solarized) because otherwise it
may not look as expected. If you don't like to use the Solarized theme please
uncomment the following line in the vimrc file.

```
colorscheme solarized
```

This distribution also contains the very nice looking color scheme Peaksea which 
you can enable by uncommenting the following line in your vimrc.

```
colorscheme peaksea
```

If you like to use the Vim powerline plug-in with the nice and fancy symbols
you need to install or prepare a patched font by yourself as described on the
project [homepage](https://github.com/Lokaltog/vim-powerline.git). If you do
nothing it will display a fall-back layout which is also quite nice.

### Change the install script

The packages my Vim setup requires get installed via apt-get as standard but if
you prefer to use aptitude you can simply change the variable `apt_preference`
in the `install.sh` script file.

```
apt_preference=apt-get
```

```
apt_preference=aptitude
```

The package names of the required programs match the names of the Ubuntu
12.10 sources. If they do not match on your system you can change the
`depends_on_packages` variable in the beginning of the `install.sh` file. Note:
The package names are separated by an empty space.

```
depends_on_packages=(ack-grep par vim-nox git-core exuberant-ctags)
```
