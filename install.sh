#!/bin/bash --login

#{{{
# Variable setting

# Dependencies

depends_on_packages=(ack-grep par vim-nox git-core exuberant-ctags)



# Folder and files

folder_home_vim=~/.vim
folder_home_vim_bundles=~/.vim/bundle
folder_home_vim_bundle_neobundle=~/.vim/bundle/neobundle.vim

file_home_vim_bundles=~/.vim/bundles.vim 
file_home_dot_vimrc=~/.vimrc
file_home_vim_vimrc=~/.vim/vimrc
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

#}}}

#{{{
# Functions definition

#{{{
function write_log_entry()
{
	echo "${1}" >> ${file_this_script_logfile}	
}
#}}}

#{{{
function check_for_process_error()
{
	if [ ${?} -eq "0" ]
	then
		write_log_entry "func: ${FUNCNAME[1]}: ${2} OK"  
	else
		write_log_entry "func: ${FUNCNAME[1]}: ${1} ${2}"  
	fi	
}
#}}}

#{{{
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
#}}}

#{{{
function big_step_display()
{
	echo ""
	echo ${step_big}
	echo "${1}"
	echo ${step_big}
	echo ""
}
#}}}

#{{{
function sudo_install_packages() 
{
	big_step_display "Install packages"

	for package in "$@"  
	do
		if dpkg -s ${package} &> /dev/null
		then 
			echo "${package} already installed: skip"
			echo ${step_small}
		else 
			echo "Installs" ${package}
			sudo apt-get -y install ${package} > /dev/null 
			check_for_process_error "Problems installing the package:" ${package}
			echo ${step_small}
		fi

	done
}
#}}}

#{{{
function execute_command()
{
	big_step_display "${1}"

	${2} 2> /dev/null
	check_for_process_error "Problems executing the command" ${2}
}
#}}}

#{{{
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
#}}}


#{{{
function my_vim_setup()
{
	welcome_display "my-vim-setup script" "${message_intro}"

	sudo_install_packages ${depends_on_packages[@]}

	backup_content ${folder_home_vim}
	backup_content ${file_home_dot_vimrc}

	execute_command "Clone into my-vim-setup repo" "git clone https://github.com/cpfaff/vim-my-setup.git ${folder_home_vim}"
  
   execute_command "Create bundle folder" "mkdir -p ${folder_home_vim_bundles}"
  
   execute_command "Clone into neobundle repo" "git clone git://github.com/Shougo/neobundle.vim ${folder_home_vim_bundle_neobundle}"

	execute_command "Link the .vimrc to user home" "ln -s ${file_home_vim_vimrc} ${file_home_dot_vimrc}"
       
	big_step_display "Install the bundles!"
   vim -u ${file_home_vim_bundles} +NeoBundleInstall +qall

	big_step_display "The Vim setup is ready!"
}
#}}}
#}}}

#{{{
# Function calls
   my_vim_setup
#}}}
