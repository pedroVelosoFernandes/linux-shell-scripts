#!/bin/bash

# Inicializar array associativo installCommands
declare -A installCommands=(
    ["spotify"]="spotify"
    ["discord"]="discord"
    ["vlc"]="vlc"
    ["slack"]="slack"
    ["vscode"]="code --classic"
    ["mattermost"]="mattermost-desktop"
    ["obs"]="obs-studio"
    ["gimp"]="gimp"
)

# Definir função ask_installation antes do loop for
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

# Definir função de instalação
execute_installation(){
    local command=$1
    echo "Comando para instalar: sudo snap install $command"
    
    if ! snap list $command &> /dev/null; then 
        sudo snap install $command &> /dev/null
    else
        echo "$command já está instalado."
    fi
}

# Iterar sobre todos os softwares
for software in "${!installCommands[@]}"; do
    ask_installation "$software"
done

echo -e "\nInstalação finalizada."
echo "Você precisará fazer logout e login novamente para que todas as alterações tenham efeito."
