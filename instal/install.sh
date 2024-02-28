#!/bin/bash

coo=1
IVAR="/etc/http-instas"
SCPT_DIR="/etc/SCRIPT"
rm -f gera*
source <(curl -sSL https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/otros/msg) >/dev/null

add-apt-repository universe
apt update -y
apt upgrade -y

install_ini() {
    clear
    msg -bar
    echo -e "\033[92m        -- INSTALANDO PAQUETES NECESARIOS -- "
    msg -bar
    ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    locale-gen en_US.UTF-8 >/dev/null 2>&1
    update-locale LANG=en_US.UTF-8 >/dev/null 2>&1
    echo -e "\033[97m  # Instalando  UTF...................... $ESTATUS "
    apt-get install gawk -y >/dev/null 2>&1
    #bc
    [[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] || apt-get install jq -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install jq................... $ESTATUS "
    #SCREEN
    [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || apt-get install screen -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install screen............... $ESTATUS "
    #apache2
    [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || {
        apt-get install apache2 -y &>/dev/null
        sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
        service apache2 restart >/dev/null 2>&1 &
    }
    [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install apache2.............. $ESTATUS "
    #curl
    [[ $(dpkg --get-selections | grep -w "curl" | head -1) ]] || apt-get install curl -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "curl" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "curl" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install curl................. $ESTATUS "
    #socat
    [[ $(dpkg --get-selections | grep -w "socat" | head -1) ]] || apt-get install socat -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "socat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "socat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install socat................ $ESTATUS "
    #netcat
    [[ $(dpkg --get-selections | grep -w "netcat" | head -1) ]] || apt-get install netcat -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install netcat............... $ESTATUS "
    #netcat-traditional
    [[ $(dpkg --get-selections | grep -w "netcat-traditional" | head -1) ]] || apt-get install netcat-traditional -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat-traditional" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat-traditional" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install netcat-traditional... $ESTATUS "
    #net-tools
    [[ $(dpkg --get-selections | grep -w "net-tools" | head -1) ]] || apt-get install net-tools -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "net-tools" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "net-tools" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install net-tools............ $ESTATUS "
    #cowsay
    [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || apt-get install cowsay -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install cowsay............... $ESTATUS "
    #figlet
    [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || apt-get install figlet -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install figlet............... $ESTATUS "
    #lolcat
    apt-get install lolcat -y &>/dev/null
    sudo gem install lolcat &>/dev/null
    [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install lolcat............... $ESTATUS "
    #PV
    [[ $(dpkg --get-selections | grep -w "pv" | head -1) ]] || apt-get install pv -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "pv" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "pv" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install PV   ................ $ESTATUS "
    msg -bar
    echo -e "\033[92m La instalacion de paquetes necesarios a finalizado"
    msg -bar
    echo -e "\033[97m Si la instalacion de paquetes tiene fallas"
    echo -ne "\033[97m     Reintentar Install Paquetes [ s/n ]: "
    read inst
    [[ $inst = @(s|S|y|Y) ]] && install_ini
}

check_ip() {
    MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MIP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
    echo "$IP" >/usr/bin/vendor_code
}
function_verify() {
    unset keybot
    msg -bar
    [[ ! -e /etc/nivbot ]] && echo >/etc/nivbot
    echo -e "\e[31m          BOTGEN LIBRE TE LO VENDIERON ?\e[32m"
    [[ "$(echo "$(cat </etc/nivbot)")" < "3" ]] && {
        [[ -e /bin/downloadbot ]] && {
            [[ -z $(cat </bin/downloadbot) ]] && read -p " DIGITE SI O NO : " keybot || unset keybot
        }
    } || read -p " DIGITE SI O NO: " keybot
    [[ -z $keybot ]] && {
        [[ -e /bin/downloadbot ]] && link="$(cat </bin/downloadbot)" || link='https://raw.githubusercontent.com'
        [[ $link = 'https://raw.githubusercontent.com' ]] && echo "CONTROL MEDIANTE GitHub" || echo "CONTROL EXTERNO"
        permited=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Bot/Control-Bot")
    } || {
        permited=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Bot/Control-Bot")
        [[ -z $keybot ]] && echo $link >/bin/downloadbot || echo -e "$(ofus $keybot)" >/bin/downloadbot
    }
    permited=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Bot/Control-Bot")
    [[ $(echo $permited | grep "${IP}") = "" ]] || {
        clear
        msg -bar
        echo -e "\n"
        echo -e "\e[31m    LA IP $(wget -qO- ipv4.icanhazip.com) FUE RECHAZADA!"
        echo -e " $link No AUTORIZADA el ACCESO "
        echo -e " SI DESEAS USAR EL BOTGEN CONTACTE A @ChumoGH"
        msg -bar
        [[ -e "/bin/ShellBot.sh" ]] && rm /bin/ShellBot.sh
        [[ -e /bin/downloadbot ]] && rm -f /bin/downloadbot
        echo -e "\n"
        msg -bar
        exit 1
    } && {
        ### INTALAR VERCION DE SCRIPT
        clear && clear
        msg -bar
        echo -e "\e[32m      LA IP $(wget -qO- ipv4.icanhazip.com) ESTA AUTORIZADA!"
        [[ -e /usr/bin/downBase ]] || echo 'https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/Otros/lista' >/usr/bin/downBase && chmod 777 /usr/bin/downBase
        v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/adm-lite/v-local.log")
        [[ ! -e /bin/downloadbot ]] && {
            [[ $link = 'https://raw.githubusercontent.com' ]] && echo "https://raw.githubusercontent.com" >/bin/downloadbot || echo "$(ofus $keybot)" >/bin/downloadbot
            chmod +x /bin/downloadbot
        }
        [[ -e /etc/nivbot ]] && {
            i=$(cat </etc/nivbot)
            lv=$(($i + 1))
            echo $lv >/etc/nivbot
        } || echo "1" >/etc/nivbot
        echo $Key >/etc/valkey && chmod +x /etc/valkey
        [[ -e /usr/bin/downBase ]] || echo 'https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/Otros/lista' >/usr/bin/downBase && chmod 777 /usr/bin/downBase
        [[ -e /bin/ShellBot.sh ]] && wget -O /bin/ShellBot.sh https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/Otros/ShellBot.sh >/dev/null && chmod +rwx /bin/ShellBot.sh

        sleep 3s
    }

}

echo '0' >/etc/http-instas 
[[ -d $SCPT_DIR ]] && rm -rf $SCPT_DIR

#CORES
cor[1]="\033[1;36m"
cor[2]="\033[1;32m"
cor[3]="\033[1;31m"
cor[4]="\033[1;33m"
cor[0]="\033[1;37m"

#TEXTOS

#COMPARA
fun_filez() {
    fup="$HOME/update"
    echo "$1" >>$HOME/files.log

    wget -O /bin/http-server.sh https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/bot/http-server.py  && chmod +x /bin/http-server.sh
    [[ -e $1 ]] && mv -f ${fup}/$1 /etc/SCRIPT/$1
}

ofus() {
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
        txt[$i]=$(echo "$1" | cut -b $i)
        case ${txt[$i]} in
        ".") txt[$i]="v" ;;
        "v") txt[$i]="." ;;
        "1") txt[$i]="@" ;;
        "@") txt[$i]="1" ;;
        "2") txt[$i]="?" ;;
        "?") txt[$i]="2" ;;
        "4") txt[$i]="p" ;;
        "p") txt[$i]="4" ;;
        "-") txt[$i]="L" ;;
        "L") txt[$i]="-" ;;
        esac
        txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
}

DOWS() {
    wget -O /root/lista https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/otros/lista
    wget --no-check-certificate -i $HOME/lista
}

function aguarde() {
    sleep 1
    fun_ejec=$1
    helice() {
        DOWS >/dev/null 2>&1 &
        tput civis
        while [ -d /proc/$! ]; do
            for i in / - \\ \|; do
                sleep .1
                echo -ne "\e[1D$i"
            done
        done
        tput cnorm
    }
    echo -ne "\033[1;37m TRASLADANDO FILES \033[1;32mSCRIPT \033[1;37me \033[1;32mAUTOGEN\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
    helice
    echo -e "\e[1D REALIZADO"
}

atualiza_fun() {
    msg -bar
    [[ -d ./update ]] && rm -rf ./update/* || mkdir ./update
    cd ./update/
    aguarde
    unset arqs
    n=1
    rm -f $HOME/files.log
    for arqs in $(ls $HOME/update); do
        echo -ne "\033[1;33m FILE \e[32m [${n}.gen] \e[0m "
        fun_filez $arqs >/dev/null 2>&1 && echo -e "\033[1;31m- \033[1;31m $arqs (no Trasladado!)" || echo -e "\033[1;31m- \033[1;32m $arqs Trasladado!"
        n=$(($n + 1))
    done
    mkdir -p /etc/SCRIPT
    mv -f /root/update/* /etc/SCRIPT/
    wget -q -O /usr/bin/gerar https://raw.githubusercontent.com/Dealer-Dev/dealerBot/main/menu/gerador.sh && chmod +rwx /usr/bin/gerar
    cd $HOME
    msg -bar
    echo -e "\033[1;92m           DIGITE EL COMANDO: \033[1;33mgerar  "
    msg -bar
    [[ -e $HOME/lista ]] && rm $HOME/lista
    [[ -d $HOME/update ]] && rm -rf $HOME/update
}

unset Key
[[ $1 = '--install' ]] && install_ini
[[ $1 = '' ]] && clear && echo " DESTRUYENDO FICHERO rm -rf /bin " && exit
clear
check_ip
atualiza_fun

