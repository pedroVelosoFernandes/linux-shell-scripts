#!/bin/bash

echo -e "Iniciando script de instalação"

echo -e "\nAtualizando pacotes e repositorios do sistema..."
sudo apt update -y &> /dev/null
sudo apt upgrade -y &> /dev/null

echo -e "\nInstalando utilitários e programas essenciais..."
sudo apt install curl make git vim ca-certificates -y &> /dev/null

echo -e "\nConfigurações do git:"
read -p " * Digite seu user.name do git: " git_user_name
read -p " * Digite seu user.email do git: " git_user_email
git config --global user.name $git_user_name
git config --global user.email $git_user_email
git config --global core.editor vim

script_atual=$(basename "$0")

for arquivo in *.sh; do
    if [ "$arquivo" == "$script_atual" ]; then
        echo "Script $arquivo ignorado."
    else
        echo "Deseja executar o script $arquivo? [y/N]"
        read resposta

        if [[ $resposta =~ ^[Yy]$ ]]; then
            echo "Executando $arquivo..."
            bash "$arquivo"
        else
            echo "Script $arquivo ignorado."
        fi
    fi
done

echo
echo -e "\nInstalação finalizada."
echo "Você precisará fazer logout e login novamente para que todas as alterações tenham efeito."
