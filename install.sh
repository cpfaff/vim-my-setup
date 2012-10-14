#!/bin/bash --login

# ruby version
ruby_version=1.9.3

depends_on_packages=(par ruby1.8-dev vim-nox git-core exuberant-ctags)

file_this_script_logfile=/tmp/my-vim-setup.log

folder_vim_vim=~/.vim
file_vim_vimrc=~/.vimrc
link_vim_vimrc_from=~/.vim/vimrc
link_vim_vimrc_to=~/.vimrc

my_vim_setup_cloneto=~/.vim
vundle_clone_to=~/.vim/bundle/vundle

# Messages
message_intro=$(cat <<EOF

Welcome to the my-vim-setup installation script. This script will install your
complete vim setup using the vundle package.

EOF
)

# Pseudo ui 
frame_big="OO====================================================================================O0"
frame_small="O===================================================================O"
step_big="----------------------------------------------------------o"
step_small="---------------------------"


function write_log_entry()
{
	echo "${1}" >> ${file_this_script_logfile}	
}

function check_for_process_error()
{
	if [ ${?} -eq "0" ]
	then
		write_log_entry "func: ${FUNCNAME[1]}: ${2} OK"  
	else
		write_log_entry "func: ${FUNCNAME[1]}: ${1} ${2}"  
	fi	
}


function welcome_display()
{
	clear
	echo ${frame_big}
	echo -e "\t\t\t\t" "${1}"
	echo ${frame_big}
	echo ""
	echo "${2}"
	echo ""
	echo ${frame_big} 
	echo ""
}

function big_step_display()
{
	echo ""
	echo ${step_big}
	echo "${1}"
	echo ${step_big}
	echo ""
}

function sudo_install_packages() 
{
	big_step_display "Install packages"

	for package in "$@"  
	do
		if dpkg -s ${package} &> /dev/null
		then 
			echo "${package} already installed: skip"
		else 
			echo "Installs" ${package}
			sudo apt-get -y install ${package} > /dev/null 
			check_for_process_error "Problems installing the package:" ${package}
			echo ${step_small}
		fi

	done
}

function execute_command()
{
	big_step_display "${1}"

	${2} 2> /dev/null
	check_for_process_error "Problems executing the command" ${2}
}

function backup_content()
{
	big_step_display "Backup content"

	echo "Backup" ${1}
	if [ -e ${1} ]
	then
		cp -rf ${1}{,.bck}
		check_for_process_error "Problems backing up the file" ${1}
		rm -rf ${1}
		check_for_process_error "Problems deleting the file" ${1}

	else
		echo "Skipping backup"
	fi
}


function my_vim_setup()
{

welcome_display "my-vim-setup script" "${message_intro}"

sudo_install_packages ${depends_on_packages[@]}

backup_content ${folder_vim_vim}
backup_content ${file_vim_vimrc}

execute_command "Clone into my-vim-setup repo" "git clone https://github.com/cpfaff/vim-my-setup.git ${my_vim_setup_cloneto}"
execute_command "Clone into vundle repo" "git clone https://github.com/gmarik/vundle.git ${vundle_clone_to}"

execute_command "Link the .vimrc to user home" "ln -s ${link_vim_vimrc_from} ${link_vim_vimrc_to}"

# Install the Bundles
execute_command "Installing the bundles" "vim -u setup_vimrc -c :BundleInstall -c :q -c :q"

# rvm ensure system ruby
if which rvm 
then
	execute_command "Change to system ruby" "rvm use system"
fi

# Go to the comand-t build folder
pushd ~/.vim/bundle/Command-T/ruby/command-t/ > /dev/null
	# Execute the extconf.rb file
	execute_command "Execute the extconf" "ruby extconf.rb"
	execute_command "Make command-t plugin" "make"
popd

# rvm reset ruby version
if which rvm 
then
	execute_command "Change back to latest ruby" "rvm use ${ruby_version}"
fi

echo "Vim setup ready!"
}

# Function call
my_vim_setup

exit 0



