#!/bin/bash

# Cores ANSI
COLORS=(
  '\033[0;31m'  # Vermelho
  '\033[0;32m'  # Verde
  '\033[0;33m'  # Amarelo
  '\033[0;34m'  # Azul
  '\033[0;35m'  # Magenta
  '\033[0;36m'  # Ciano
  '\033[0;37m'  # Branco
)
RESET='\033[0m'  # Reset para cor padrão

# Função para escolher uma cor aleatória
cor_aleatoria() {
  echo -e "${COLORS[$((RANDOM % ${#COLORS[@]}))]}"  # Seleciona uma cor aleatória
}

# Variáveis Globais
LARGURA_TELA=$(tput cols)  # Obtém a largura da tela

# Função para centralizar mensagens
exibir_centralizado() {
  cor=$(cor_aleatoria)  # Seleciona uma cor aleatória
  printf "%b%*s%b\n" "$cor" $(((${#1}+$LARGURA_TELA)/2)) "$1" "$RESET"  # Exibe mensagem centralizada
}

# Informações sobre o programa
informacoes_autor() {
  clear  # Limpa a tela
  exibir_centralizado "====================================="  # Linha superior
echo 
  exibir_centralizado "              AUTHOR: HACKERSAPROVADO 👨🏽‍💻 EVILCORP"  # Informações do autor
echo
  exibir_centralizado "       NOME: PAINEL AVIATOR 🕹️"  # Nome do programa
echo 
  exibir_centralizado "              VERSÃO: 🕹️ 2.1-14.2 ⚡"  #Versão do programa
echo
  exibir_centralizado "FB: HTTPS://FACEBOOK.COM/HACKERSAPROVADO"  # Facebook do autor
echo
  exibir_centralizado "         NÚMERO DE SUPORTE: 856777749 💣 861448225"  # Número de contato
echo
  exibir_centralizado "TIKTOK CONTEÚDOS: @HACKERSAPROVADO"  # TikTok do autor
echo
  exibir_centralizado "======================================="  # Linha inferior
  sleep 5  # Pausa para leitura
}
echo
# Função para exibir uma nota de boas-vindas
boas_vindas() {
 echo # Limpa a tela
  exibir_centralizado "BEM-VINDO AO SISTEMA AVIATOR"  # Mensagem de boas-vindas
echo
  sleep 2  # Pausa para leitura
}

# Função para animação de um avião passando da direita para a esquerda
animacao_aviao() {
  aviao=""  # Símbolo do avião
  for ((i=LARGURA_TELA; i>0; i--))  # Loop para animação do avião
  do
    cor=$(cor_aleatoria)  # Seleciona uma cor aleatória
    printf "\r%b%${i}s%b" "$cor" "$aviao" "$RESET"  # Exibe o avião na tela
    sleep 0.1  # Pausa para animação
  done
  echo  # Nova linha após a animação
}

# Função para gerar uma chave aleatória
gerar_chave_acesso() {
  echo $(openssl rand -hex 10)  # Gera uma chave aleatória usando OpenSSL
}
echo 
# Função de seleção múltipla para plataforma
selecionar_plataforma() {
  exibir_centralizado "SELECIONE A SUA PLATAFORMA:"  # Mensagem de seleção
  plataformas=("ELEPHANTBET" "BETWAY" "Placard" "JOGABET" "PREMIERBET" "BACELABET" "HOLLYWOODBETS" "888BET" "WINNERBET" "OUTROS")  # Opções de plataformas
  echo 
  select plataforma in "${plataformas[@]}"; do  # Menu de seleção
    if [[ -n "$plataforma" ]]; then  # Verifica se uma opção válida foi selecionada
      exibir_centralizado "PLATAFORMA SELECIONADA FOI: ${plataforma^^}"  # Exibe plataforma selecionada
      break  # Sai do loop
    else
      exibir_centralizado "SELEÇÃO INVÁLIDA, TENTE NOVAMENTE."  # Mensagem de erro
    fi
  done
}
echo 
# Função de seleção múltipla para tipo de pagamento
selecionar_tipo_pagamento() {
  exibir_centralizado "SELECIONE O SEU TIPO DE PAGAMENTO:"  # Mensagem de seleção
  tipos_pagamento=("MPESA" "EMOLA" "PONTO24" "BANCO" "OUTROS")  # Opções de pagamento
  echo 
  select tipo_pagamento in "${tipos_pagamento[@]}"; do  # Menu de seleção
    if [[ -n "$tipo_pagamento" ]]; then  # Verifica se uma opção válida foi selecionada
      exibir_centralizado "TIPO DE PAGAMENTO SELECIONADO FOI: ${tipo_pagamento^^}"  # Exibe tipo de pagamento selecionado
echo 
      break  # Sai do loop
    else
      exibir_centralizado "SELEÇÃO INVÁLIDA, TENTE NOVAMENTE."  # Mensagem de erro
    fi
  done
}

# Função para exibir progresso e indicador de carregamento
exibir_carregamento() {
  cor=$(cor_aleatoria)  # Seleciona uma cor aleatória
echo 
  printf "\n%s🇲🇿 PROCESSANDO O SEU ⚡ PEDIDO AGUARDE POR FAVOR" "$cor"  # Mensagem de carregamento
  for i in {1..5}; do  # Loop para exibir pontos de carregamento
    printf "🚀"
    sleep 1  # Pausa entre os pontos
  done
  printf "%s\n" "$RESET"  # Limpa a formatação de cor
}

# Função para calcular a data de expiração com base na validade fornecida

calcular_data_expiracao() {
  local dias_validade=$1  # Recebe o número de dias de validade
  date -d "$dias_validade days" +"%d/%m/%Y %H:%M:%S"  # Retorna a data de expiração formatada
}

# Função para registrar um novo cliente
registrar_cliente() {
    # Limpa a tela
  exibir_centralizado "👤 FORNEÇA SEGUINTES INFORMAÇÕES PARA REGISTRAR UM NOVO CLIENTE."  # Mensagem de instrução
    # Nova linha
  
  # Solicita o nome de usuário
  read -p "$(exibir_centralizado 'DIGITE SEU USUÁRIO 👤: ')" usuario  
  while [[ -z "$usuario" ]]; do  # Verifica se o usuário não está vazio
    exibir_centralizado "ERRO: O USUÁRIO NÃO PODE SER VAZIO."  # Mensagem de erro
echo
    read -p "$(exibir_centralizado 'DIGITE SEU USUÁRIO 👤: ')" usuario  # Solicita novamente
  done
  echo  # Nova linha
  
  # Solicita a senha
  read -p "$(exibir_centralizado 'DIGITE SUA SENHA: ')" senha  
  while [[ ${#senha} -lt 6 ]]; do  # Verifica se a senha tem pelo menos 6 caracteres
    exibir_centralizado "ERRO: A SENHA DEVE CONTER PELO MENOS 6 CARACTERES."  # Mensagem de erro
echo
    read -p "$(exibir_centralizado 'DIGITE SUA SENHA: ')" senha  # Solicita novamente
  done
  echo  # Nova linha
  
  # Solicita o número
  read -p "$(exibir_centralizado 'DIGITE O SEU NÚMERO 🔢: ')" numero  
  while ! [[ $numero =~ ^[0-9]+$ ]]; do  # Verifica se o número contém apenas dígitos
    exibir_centralizado "ERRO: O NÚMERO DEVE CONTER APENAS DÍGITOS."  # Mensagem de erro
echo
    read -p "$(exibir_centralizado 'DIGITE O SEU NÚMERO 🔢: ')" numero  # Solicita novamente
  done
  echo  # Nova linha
  
  selecionar_plataforma  # Chama a função de seleção de plataforma
  echo  # Nova linha
  read -p "$(exibir_centralizado 'DIGITE O SEU PAGAMENTO: ')" pagamento  # Solicita o pagamento
  clear
  echo  # Nova linha
  selecionar_tipo_pagamento  # Chama a função de seleção de tipo de pagamento
  echo  # Nova linha
  
  read -p "$(exibir_centralizado 'VALIDADE (EXEMPLO: 1/7/30): ')" validade
  # Solicita a validade do registro
  while ! [[ "$validade" =~ ^[0-9]+$ ]]; do  # Verifica se a validade é um número válido
    exibir_centralizado "ERRO: INSIRA UM NÚMERO VÁLIDO DE DIAS."  # Mensagem de erro
    read -p "$(exibir_centralizado 'VALIDADE (EXEMPLO: 1/7/30): ')" validade  # Solicita novamente
  done
  echo  # Nova linha
  data_inscricao=$(date +"%d/%m/%Y %H:%M:%S")  # Data e Hora de inscrição
  data_validade=$(calcular_data_expiracao "$validade")  # Data de expiração (com hora)

  exibir_carregamento  # Exibe carregamento enquanto processa a informação
  chave_acesso=$(gerar_chave_acesso)  # Gera uma chave de acesso aleatória
  
  # Criação da pasta para o usuário
  pasta_cliente="Clientes/${usuario}"  # Caminho da pasta do cliente
  mkdir -p "$pasta_cliente"  # Cria a pasta, se não existir

  # Salvando dados do cliente em um arquivo JSON com quebras de linha
  arquivo_json="${pasta_cliente}/dados_cliente.json"  # Caminho do arquivo JSON
  {
    echo "{"  # Início do objeto JSON
    echo "  \"USUARIO\": \"${usuario^^}\","  # Adiciona o usuário ao JSON em maiúsculas
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"SENHA\": \"${senha^^}\","  # Adiciona a senha ao JSON em maiúsculas
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"NUMERO\": \"$numero\","  # Adiciona o número ao JSON
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"PLATAFORMA\": \"${plataforma^^}\","  # Adiciona a plataforma ao JSON em maiúsculas
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"PAGAMENTO\": \"${pagamento^^}\","  # Adiciona o pagamento ao JSON em maiúsculas
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"TIPO_PAGAMENTO\": \"${tipo_pagamento^^}\","  # Adiciona tipo de pagamento ao JSON em maiúsculas
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"DATA_INSCRICAO\": \"$data_inscricao\","  # Adiciona data de inscrição ao JSON
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"DATA_EXPIRACAO\": \"$data_validade\","  # Adiciona data de expiração ao JSON
    echo ""  # Quebra de linha para melhor formatação
    echo "  \"CHAVE_ACESSO\": \"$chave_acesso\""  # Adiciona chave de acesso ao JSON
    echo ""  # Quebra de linha para melhor formatação
    echo "}"  # Fim do objeto JSON

    # Adicionando um espaço em branco após cada registro para clareza
    echo
  } > "$arquivo_json"  # Redireciona a saída para o arquivo JSON
  
  # Compactação dos dados do cliente
  tar -czf "${pasta_cliente}.tar.gz" "$pasta_cliente"  # Compacta a pasta do cliente em um arquivo tar.gz
  
   echo # Limpa a tela
  exibir_centralizado "DADOS DO CLIENTE REGISTRADO COM SUCESSO!"  # Mensagem de sucesso
echo
  sleep 5  # Pausa para leitura
  exibir_centralizado "A CHAVE DE ACESSO GERADA PARA $usuario É: $chave_acesso"  # Exibe a chave de acesso
echo
sleep 8
  exibir_centralizado "DATA DE EXPIRAÇÃO: $data_validade"  # Exibe a data de expiração
echo
}

# Função principal
main() {
  informacoes_autor  # Chama a função que exibe informações do autor
  boas_vindas  # Chama a função que exibe a nota de boas-vindas
  animacao_aviao &  # Chama a função que anima o avião em segundo plano
  registrar_cliente  # Chama a função que registra um novo cliente
  wait  # Aguarda a animação antes de finalizar
}
echo 
# Tratamento de interrupções (CTRL+C)
trap 'clear; exibir_centralizado "O PROGRAMA FOI INTERROMPIDO. ATÉ LOGO LÍDER!"; exit' SIGINT  # Captura a interrupção para exibir mensagem de saída
echo
# Chamada da função principal
main  # Executa a função principal

