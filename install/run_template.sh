#!/bin/bash

# Verifica se o arquivo YAML existe
if [ -f "template_sh.yaml" ]; then
    echo "Arquivo YAML encontrado."
    
    # Lê o arquivo YAML e executa os scripts marcados como verdadeiros
    while IFS=':' read -r script rodar; do
        #tirar os espaços que criou
        script=$(echo "$script" | tr -d '[:space:]')
        rodar=$(echo "$rodar" | tr -d '[:space:]')
    
        if [ "$rodar" = "true" ]; then
            echo "Executando script $script.sh"
            bash "$script.sh"
        fi
    done < template_sh.yaml

else
    echo "Arquivo YAML não encontrado."
fi
