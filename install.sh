#!/bin/bash --login

# ruby version
ruby_version=1.9.3

depends_on=(par ruby1.8-dev vim-nox git-core exuberant-ctags)

file_this_script_logfile=/tmp/my-vim-setup.log

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

	${2}
	check_for_process_error "Problems executing the command" ${2}
}

welcome_display "my-vim-setup script" "${message_intro}"
sudo_install_packages ${depends_on[@]}

# Backup the existing vim folder  
# mv ~/.vim ~/.vim_bck
execute_command "Backup vim folder" "mv ~/.vim ~/.vim_bck"

# Clone into my repository setup vundle
execute_command "Clone into my-vim-setup repo" "git clone https://github.com/cpfaff/vim-my-setup.git ~/.vim"

execute_command "Clone into vundle repo" "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"

# Backup the existing vimrc
# mv ~/.vimrc ~/.vimrc_bck
execute_command "Backup the .vimrc file" "mv ~/.vimrc ~/.vimrc_bck"

# Symbolic link the vimrc file
execute_command "Link the .vimrc to user home" "ln -s ~/.vim/vimrc ~/.vimrc"

# Install the Bundles
vim -c :BundleInstall -c :q -c :q

# rvm ensure system ruby
if which rvm 
then
	rvm use system
fi

# Go to the comand-t build folder
pushd ~/.vim/bundle/Command-T/ruby/command-t/
	# Execute the extconf.rb file
	ruby extconf.rb
	make
popd

# rvm reset ruby version
if which rvm 
then
	rvm use ${ruby_version} 
fi

echo "Vim setup ready!"

exit 0



