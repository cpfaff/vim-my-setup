# My Vim setup

This is my personal Vim setup. It can be installed manual or with an installer
bash script. Both methods are described in detail below. The setup uses the
Vundle package manager to handle the plugins listetd below.

## Script install 

### With Curl

If you have curl installed on your machine you can simply use the command below
for installation. It scrapes the install script from github and pipes it into
bash.

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


## Used packages

```
Bundle 'vim-scripts/CmdlineComplete.git'
Bundle 'vim-scripts/LustyJuggler.git'
Bundle 'godlygeek/tabular.git'
Bundle 'tomtom/tlib_vim.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'Townk/vim-autoclose.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'tpope/vim-rails.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'vim-scripts/Vim-R-plugin.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'sukima/xmledit.git'
Bundle 'vim-scripts/YankRing.vim.git'
Bundle 'rosenfeld/conque-term.git'
Bundle 'vim-scripts/tex.vim--Tanzler'
Bundle 'vim-scripts/peaksea.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'guns/xterm-color-table.vim.git'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'kien/ctrlp.vim.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neocomplcache-snippets-complete.git'
Bundle 'honza/snipmate-snippets.git'
```
