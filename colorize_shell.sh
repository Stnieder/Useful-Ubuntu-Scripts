#Articles
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://en.wikipedia.org/wiki/ANSI_escape_code#Colors

#!/bin/bash
#End of coloring
NC="\033[0m"

#Standard colors
BLA="\033[0;30m"
RED="\033[0;31m"
GRE="\033[0;32m"
YEL="\033[0;33m"
BLU="\033[0;34m"
MAG="\033[0;35m"
CYA="\033[0;36m"
WHI="\033[0;37m"

#Background standard color
BG_BLA="\033[0;40m"
BG_RED="\033[0;41m"
BG_GRE="\033[0;42m"
BG_YEL="\033[0;43m"
BG_BLU="\033[0;44m"
BG_MAG="\033[0;45m"
BG_CYA="\033[0;46m"
BG_WHI="\033[0;40m"

#Bright colors
BR_BLA="\033[0;90m"
BR_RED="\033[0;91m"
BR_GRE="\033[0;92m"
BR_YEL="\033[0;93m"
BR_BLU="\033[0;94m"
BR_MAG="\033[0;95m"
BR_CYA="\033[0;96m"
BR_WHI="\033[0;97m"

#Background bright color
BG_BBLA="\033[0;100m"
BG_BRED="\033[0;101m"
BG_BGRE="\033[0;102m"
BG_BYEL="\033[0;103m"
BG_BBLU="\033[0;104m"
BG_BMAG="\033[0;105m"
BG_BCYA="\033[0;106m"
BG_BWHI="\033[0;107m"

function searchStandText {
	declare -a colors=("BLA" "RED" "GRE" "YEL" "BLU" "MAG" "CYA" "WHI")
	foundColor=0
	for i in "${colors[@]}"
	do
		echo $i
		if [ $1 == $i ]
		then
			foundColor=1
		else
			echo "$1 : $i"
		fi
	done
	echo $foundColor
}

function searchStandBack {
	colors=("BG_BLA" "BG_RED" "BG_GRE" "BG_YEL" "BG_BLU" "BG_MAG" "BG_CYA" "BG_WHI")
	for i in ${colors[*]}
	do
		if [ "${1}" == "${i}" ]
		then 
			return 1
		else
			echo "Not the right color.${i} : ${1}:"
		fi
	done
	return 0
}


function searchBrightText {
	colors=("BR_BLA" "BR_RED" "BR_GRE" "BR_YEL" "BR_BLU" "BR_MAG" "BR_CYA" "BR_WHI")
	for i in ${colors[*]}
	do
		if [ "${1}" == "${i}" ]
		then 
			return 1
		else
			echo "Not the right color.${i} : ${1}:"
		fi
	done
	return 0
}

function searchBrightBack {
	colors=("BG_BBLA" "BG_BRED" "BG_BGRE" "BG_BYEL" "BG_BBLU" "BG_BMAG" "BG_BCYA" "BG_BWHI")
	for i in ${colors[*]}
	do
		if [ "${1}" == "${i}" ]
		then 
			return 1
		else
			echo "Not the right color. ${i} : ${1}:"
		fi
	done
	return 0
}


function echoStandard {
	searchStandText $1 foundColor
	if [ "${foundColor}" == "1" ]
	then
		echo -e "${!1}${2}${NC}"
	else
		echo "No such color found. Please run '${package} --help' and check the right syntax."
		break
	fi
}

function echoStandardBack {
	searchStandText $1 foundColor
	if [ "${foundColor}" == "1" ]
	then
		echo -e "${!1}${2}${NC}"
	else
		echo "No such color found. Please run '${package} --help' and check the right syntax."
		break
	fi
}



function echoBright {
	searchStandText $1 foundColor
	if [ "${foundColor}" == "1" ]
	then
		echo -e "${!1}${2}${NC}"
	else
		echo "No such color found. Please run '${package} --help' and check the right syntax."
		break
	fi
}


function echoBrightBack {
	searchStandText $1 foundColor
	if [ "${foundColor}" == "1" ]
	then
		echo -e "${!1}${2}${NC}"
	else
		echo "No such color found. Please run '${package} --help' and check the right syntax."
		break
	fi
}


function echoRandom {
	textColor=("BLA" "RED" "GRE" "YEL" "BLU" "MAG" "CYA" "WHI" "BR_BLA" "BR_RED" "BR_GRE" "BR_YEL" "BR_BLU" "BR_MAG" "BR_CYA" "BR_WHI")
	backColor=("BG_BLA" "BG_RED" "BG_GRE" "BG_YEL" "BG_BLU" "BG_MAG" "BG_CYA" "BG_WHI" "BG_BBLA" "BG_BRED" "BG_BGRE" "BG_BYEL" "BG_BBLU" "BG_BMAG" "BG_BCYA" "BG_BWHI")

	RANDOM=$$$(date +%s)

	randomTextColor="${textColor[$RANDOM % ${#textColor[@]}]}"


	echo -e "${!randomTextColor}${1}${NC}"
}

function echoRandomBack {
	backColor=("BG_BLA" "BG_RED" "BG_GRE" "BG_YEL" "BG_BLU" "BG_MAG" "BG_CYA" "BG_WHI" "BG_BBLA" "BG_BRED" "BG_BGRE" "BG_BYEL" "BG_BBLU" "BG_BMAG" "BG_BCYA" "BG_BWHI")

	RANDOM=$$$(date +%s)

	randomBackColor="${backColor[$RANDOM % ${#backColor[@]}]}"

	echo -e "${!randomBackColor}${1}${NC}"
}



function echoHelp {
	echo -e "This is a simple script, to give your scripts some inside in the possibilities of bash."
	echo -e " "
	echo -e "$package [options] [color] [your text]"
	echo -e " "
	echo -e "options: "
	     echo -e "\t-h, --help		show a short help"
	     echo -e "\t-s, --standard	use standard text colors"
	     echo -e "\t-sb,--standback	use standard color for background"
	     echo -e "\t-b, --bright	use bright text colors"
	     echo -e "\t-bb, --brightback	use bright color for background"
	     echo -e "\t-r, --random	use a random text color; no color needed"
	     echo -e "\t-rb,--randomback	use a random background color; no color needed"
	echo " "
	echo -e "It is possible to use standard text color, standard background color, "
	echo -e "bright text color and bright background color."
	echo -e " "
	echo -e "The standard colors are: ${BLA}black${NC}, ${RED}red${NC}, ${GRE}green${NC}, ${YEL}yellow${NC}, ${BLU}blue${NC}, ${MAG}magenta${NC}, ${CYA}cyan${NC} and ${WHI}white${NC}."
	echo -e "The bright colors are: ${BR_BLA}black${NC}, ${BR_RED}red${NC}, ${BR_GRE}green${NC}, ${BR_YEL}yellow${NC}, ${BR_BLU}blue${NC}, ${BR_MAG}magenta${NC}, ${BR_CYA}cyan${NC} and ${BR_WHI}white${NC}."
	echo -e "Each of these colors could be used as a background."
	echo -e " "
	
	endSentence="Have a nice colorful day XD."
	for ((i=0; i<28; i++))
	do
		match=$(($i+200))
		echo -en "\033[38;5;${match}m${endSentence:i:1}${NC}"
	done
	
	echo	
}

while (("$#")); do
	case "$1" in
		-s|--standardtext)
			echoStandard $2 $3
			exit
			;;
		-sb|--standback)	
			echoStandardBack $2 $23
			exit
			;;
		-b|--brighttext)
			echoBright $2 $3
			exit
			;;
		-bb|--standback)
			echoBrightBack $2 $3
			exit
			;;
		-r|--randomtext)
			echoRandom $2
			exit
			;;
		-rb|--randomback)
			echoRandomBack $2
			exit
			;;
		-h|--help)
			echoHelp
			exit
			;;
	esac
done
