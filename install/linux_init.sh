#!bin/bash

# variaveis para iterar no for para evitar repeticao de codigo
# commando de instalar[nome do software] = "comando"
installCommands[spotify]="spotify"
installCommands[discord]="discord"
installCommands[vlc]="vlc"
installCommands[slack]="slack"
installCommands[vscode]="code --classic"
installCommands[mattermost]="mattermost-desktop"
installCommands[obs]="obs-studio"
installCommands[gimp]="gimp"

#---------------------------------------------------------------------
# itera sobre todos os softwares
for software in "${!installCommands[@]}"; do
    ask_installation $software
done

#---------------------------------------------------------------------
ask_installation(){

    local software=$1
    local command=${installCommands[$software]}

    echo "Deseja instalar $software? [y/N]"
    read resposta
    
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Instalando $software..."
        execute_installation "$command"
    else
        echo "Instalação de $software ignorada."
    fi
}
#---------------------------------------------------------------------

execute_installation(){
    local command=$1
    echo "Comando para instalar: sudo snap install $command"
    
    if ! snap list $command &> /dev/null; then 
        sudo snap install $command &> /dev/null
    else
        echo "$command já está instalado."
    fi
}

echo -e "\nInstalação finalizada."
echo "Você precisará fazer logout e login novamente para que todas as alterações tenham efeito."
