#!bin/bash

install_discord() {
    echo "Instalando o Discord..."
    
    if ! snap list discord &> /dev/null; then 
        sudo snap install discord &> /dev/null
    fi
}

install_vlc() {
    echo "Instalando o VLC..."
    
    if ! snap list vlc &> /dev/null; then 
        sudo snap install vlc &> /dev/null
    fi
}

install_slack() {
    echo "Instalando o Slack..."
    
    if ! snap list slack &> /dev/null; then 
        sudo snap install slack &> /dev/null
    fi
}

install_vs_code() {
    echo "Instalando o VS Code..."
    
    if ! snap list code &> /dev/null; then 
        sudo snap install code --classic &> /dev/null
    fi
}

install_mattermost() {
    echo "Instalando o Mattermost..."
    
    if ! snap list mattermost-desktop &> /dev/null; then 
        sudo snap install mattermost-desktop &> /dev/null
    fi
}

install_obs_studio() {
    echo "Instalando o OBS Studio..."
    
    if ! snap list obs-studio &> /dev/null; then 
        sudo snap install obs-studio &> /dev/null
    fi
}

install_gimp() {
    echo "Instalando o GIMP..."
    sudo apt install gimp &> /dev/null
}


# Discord
while true; do
    echo "Deseja executar o script Discord? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando Discord..."
        install_discord
        break
    else
        echo "Script Discord ignorado."
        break
    fi
done

# VLC
while true; do
    echo "Deseja executar o script VLC? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando VLC..."
        install_vlc
        break
    else
        echo "Script VLC ignorado."
        break
    fi
done

# Slack
while true; do
    echo "Deseja executar o script Slack? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando Slack..."
        install_slack
        break
    else
        echo "Script Slack ignorado."
        break
    fi
done

# VS Code
while true; do
    echo "Deseja executar o script VS Code? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando VS Code..."
        install_vs_code
        break
    else
        echo "Script VS Code ignorado."
        break
    fi
done

# Mattermost
while true; do
    echo "Deseja executar o script Mattermost? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando Mattermost..."
        install_mattermost
        break
    else
        echo "Script Mattermost ignorado."
        break
    fi
done

# OBS Studio
while true; do
    echo "Deseja executar o script OBS Studio? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando OBS Studio..."
        install_obs_studio
        break
    else
        echo "Script OBS Studio ignorado."
        break
    fi
done

# GIMP
while true; do
    echo "Deseja executar o script GIMP? [y/N]"
    read resposta
    if [[ $resposta =~ ^[Yy]$ ]]; then
        echo "Executando GIMP..."
        install_gimp
        break
    else
        echo "Script GIMP ignorado."
        break
    fi
done

echo -e "\nInstalação finalizada."
echo "Você precisará fazer logout e login novamente para que todas as alterações tenham efeito."
