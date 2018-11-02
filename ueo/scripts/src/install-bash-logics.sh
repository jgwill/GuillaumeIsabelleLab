#@a Installing BASH alias and resource
(cd; cat /etc/scripts/src/bashrc-tlid-bash-export.code.txt >> .bashrc )
echo "Installed code to generate TLID when a New terminal opens"
echo "Installing .bashrc alias"
(cd ; cat /etc/scripts/src/bashrc-alias.code.txt  >> .bashrc  ; source .bashrc)
