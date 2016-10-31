#!/usr/bin/env bash

#Colores
esc=`echo -en "\033"`
cc_red="${esc}[0;31m"
cc_green="\x1b[32m"
cc_yellow="${esc}[0;33m"
cc_blue="${esc}[0;34m"
cc_normal=`echo -en "${esc}[m\017"`

#Limpieza al salir
function cleanup_before_quit () {
  tput cup 13 0
  tput setaf 3
  echo -e "El instalador ha terminado, no se instaló Chocolita.                         "
  tput sgr0
  tput cnorm
  exit
}
trap cleanup_before_quit SIGINT SIGQUIT SIGTSTP

#Banner
function banner() {
    tput civis
    tput clear
    tput setaf 2
	echo -e "${cc_blue}"
	echo " _____ _                     _ _ _        ";
	echo "/  __ \ |                   | (_) |       ";
	echo "| /  \/ |__   ___   ___ ___ | |_| |_ __ _ ";
	echo "| |   | '_ \ / _ \ / __/ _ \| | | __/ _\` |";
	echo "| \__/\ | | | (_) | (_| (_) | | | || (_| |";
	echo " \____/_| |_|\___/ \___\___/|_|_|\__\__,_|";
	echo "                           Instalador v0.1";
    tput sgr0
	echo -e "${cc_normal}"
}
banner

#Variables
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__wpd="$(pwd | awk -F\/ '{print $(NF-1),$(NF)}')"
__node="$(node -v)"
__npm="$(npm -v)"
echo -e "Node: ${__node} - NPM: ${__npm}"
if [ "${__wpd}" = "wp-content themes" ]; then
	__wpv="$(grep wp_version ../../wp-includes/version.php | grep "\$wp_version =" | awk -F"['']" '{print $2}')"
	echo -e "${cc_green}Wordpress v${__wpv} ✓${cc_normal}"
	echo -e "${cc_green}Ruta de Wordpress correcta ✓${cc_normal}"
else
	echo "${cc_red}No se encontró Wordpress ✘${cc_normal}"
	echo -e "${cc_red}No estás en el directorio themes ✘${cc_normal} => cd /wordpress/wp-content/themes/"
fi
echo
tput cnorm
read -p "¿Como te gustaría nombrar tu tema de Wordpress? " name
read -p "¿Cual es tu direccion de host? (ej: localhost): " host
echo
tput cup 13 0
echo -e "Se instalará la última versión de Chocolita en el directorio:\n${cc_yellow}${__dir}/${name}${cc_normal}                       ";
echo
read -e -s -p "[ENTER] para continuar o [CTRL]-[C] para salir en cualquier momento.";
echo
echo -e "${cc_green}"
echo -e "Instalando... ${cc_normal}"
echo -e "-------------------------------------------"
if git clone https://github.com/monchitonet/Chocolita.git ${name} ; then
	echo -e "-------------------------------------------"
	cd ${name}
	echo
	sed -i "" "s/playground/${host}/g" gulpfile.js
	read -p "¿Queres correr \"npm install\" en ${name}/ (y/N)? " yn
	if [ "${yn}" = "y" ]; then
		echo
		npm install
	else
		:
	fi
	echo
	echo -e "${cc_green}Chocolita se ha instalado sin problemas ✓${cc_normal}"
	echo "Ingresa a WordPress y activa el tema. Para más información entra a https://github.com/monchitonet/Chocolita"
	exit
else
	tput setaf 3
	echo
	echo -e "${cc_red}No se pudo instalar ✘, por favor reportar el error.${cc_normal}"
	tput sgr0
    tput cnorm
	exit 1
fi