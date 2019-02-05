//Thanks to [this](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors) wikpedia article.
#!/bin/bash
//End of coloring
NC="\033[0m"

//Standard colors
BLA="\033[0;30m"
RED="\033[0;31m"
GRE="\033[0;32m"
YEL="\033[0;33m"
BLU="\033[0;34m"
MAG="\033[0;35m"
CYA="\033[0;36m"
WHI="\033[0;37m"

//Background standard color
BG_BLA="\033[0;40m"
BG_RED="\033[0;41m"
BG_GRE="\033[0;42m"
BG_YEL="\033[0;43m"
BG_BLU="\033[0;44m"
BG_MAG="\033[0;45m"
BG_CYA="\033[0;46m"
BG_WHI="\033[0;40m"

//Bright colors
BR_BLA="\033[0;90m"
BR_RED="\033[0;91m"
BR_GRE="\033[0;92m"
BR_YEL="\033[0;93m"
BR_BLU="\033[0;94m"
BR_MAG="\033[0;95m"
BR_CYA="\033[0;96m"
BR_WHI="\033[0;97m"

//Background bright color
BG_BBLA="\033[0;100m"
BG_BRED="\033[0;101m"
BG_BGRE="\033[0;102m"
BG_BYEL="\033[0;103m"
BG_BBLU="\033[0;104m"
BG_BMAG="\033[0;105m"
BG_BCYA="\033[0;106m"
BG_BWHI="\033[0;107m"

echo -e "This is just an ${RED}example${NC} for making nice ${BG_BGRE}color background${NC} ${BR_BLU}inside bash"
