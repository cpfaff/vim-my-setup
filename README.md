# My Vim setup

This is my personal Vim setup. It can be installed manual or with an installer
bash script. Both methods are described in detail below. 

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

