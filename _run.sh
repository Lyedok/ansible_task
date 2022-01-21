#!/bin/bash

ansible()
{
	ansible-playbook playbook.yml
}

if ((`wc -c < ansible.log` > 51200)); then
	echo "Attention! Ansible log is more then 50kb.
	0) Clear ansible.log and continue.
	1) Ignore and continue.
	Any other key) Exit."
	read -p "Choose your action [0-1]:" x
	case $x in
		0) echo > ansible.log 
		ansible;;
		1) ansible;;
		*) exit
	esac
else ansible
fi
