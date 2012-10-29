My Vim setup
============

This is my personal Vim setup. It can be installed manually or with a bash
installer script. Both installation methods are described in detail below. The
setup comes with a curated set of plug ins which are managed with the package
manager [NeoBundle](https://github.com/Shougo/neobundle.vim.git). The setup
and mappings ensures that all components play well together. For a full list
of installed Vim plug-ins please have a look into the `bundles.vim` file. The
mappings are documented in the vimrc file.

Note: 

This setup has only been tested on a Ubuntu Linux machine with a non graphical
Vim. The setup requires additional programs you need to install on your system
in order to use all the functionality. The dependencies are:

- ack-grep  (grep)
- par (format text)
- vim-nox (Vim)
- git-core (Git)
- exuberant-ctags (create tags)

My setup uses the Solarized color scheme as standard.
It is recommended to set also your terminal colors to
[Solarized](https://github.com/altercation/solarized) because otherwise it
will not look as expected. If you don't like to use the Solarized theme please
uncomment or change the lines in the vimrc file. This distribution also contains
the very nice looking color scheme Peaksea.

If you like to use the fancy symbols of the Vim
[powerline](https://github.com/Lokaltog/vim-powerline.git) plug-in then you also
need to prepare or install a patched font. Otherwise it will display a fall-back
default theme without them.


Script install 
---------------

The easiest way to get my Vim setup is to use the bash installer script. It
installs all required packages with apt-get (Ubuntu 12.10 sources) and all the
plug ins to extend the Vim functionality with NeoBundleInstall. The packages
installed via apt-get fit the names of Ubuntu 12.10 sources and if they do not
fit your system you can change the following variable in the beginning of the
`install.sh` file. The package names are separated by an empty space.

```
depends_on_packages=(ack-grep par vim-nox git-core exuberant-ctags)
```

### With wget 

You can use wget to download the script. Afterwards you need to make it    
executable and start the script for installation.                               


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
