#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# TERMUX POWER SETUP v1.0
# Author: bhu01hackerspace
# GitHub: https://github.com/bhu01hackespace/termux-power-setup
# Descrição: Script completo para configurar o Termux
# ============================================

# Cores para design
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Variáveis globais
VERSION="1.0.0"
LOG_FILE="$HOME/.termux-setup.log"

# ============================================
# FUNÇÕES DE UTILIDADE
# ============================================

# Função para log
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Função para mensagens com descrição
install_with_desc() {
    local tool=$1
    local desc=$2
    local package=$3
    
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
    echo -e "${BLUE}│${NC} ${BOLD}📦 Instalando: ${WHITE}$tool${NC}"
    echo -e "${BLUE}│${NC} ${YELLOW}📖 Descrição:${NC} $desc"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
    
    log "Instalando $tool: $desc"
    
    pkg install $package -y > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $tool instalado com sucesso!${NC}\n"
        log "✓ $tool instalado com sucesso"
    else
        echo -e "${RED}✗ Falha ao instalar $tool${NC}\n"
        log "✗ Falha ao instalar $tool"
    fi
}

# Função para instalar pacotes Python com descrição
install_python_pkg() {
    local pkg=$1
    local desc=$2
    
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
    echo -e "${BLUE}│${NC} ${BOLD}🐍 Instalando pacote Python: ${WHITE}$pkg${NC}"
    echo -e "${BLUE}│${NC} ${YELLOW}📖 Descrição:${NC} $desc"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
    
    log "Instalando pacote Python: $pkg - $desc"
    
    pip install $pkg > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $pkg instalado com sucesso!${NC}\n"
        log "✓ $pkg instalado com sucesso"
    else
        echo -e "${RED}✗ Falha ao instalar $pkg${NC}\n"
        log "✗ Falha ao instalar $pkg"
    fi
}

# Função para perguntar sim/não
ask_yes_no() {
    echo -e "${YELLOW}❓${NC} $1 ${CYAN}[y/N]${NC} "
    read -r answer
    case "$answer" in
        y|Y|yes|YES|sim|SIM) return 0 ;;
        *) return 1 ;;
    esac
}

# Função para mostrar menu
show_menu() {
    clear
    echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${WHITE}         TERMUX POWER SETUP v$VERSION - INSTALAÇÃO COMPLETA         ${NC}"
    echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${GREEN}1)${NC} Instalação Completa (Tudo)"
    echo -e "${GREEN}2)${NC} Apenas Linguagens de Programação"
    echo -e "${GREEN}3)${NC} Apenas Ferramentas de Rede"
    echo -e "${GREEN}4)${NC} Apenas Utilitários e Ferramentas"
    echo -e "${GREEN}5)${NC} Instalação Personalizada"
    echo -e "${RED}0)${NC} Sair"
    echo ""
    echo -ne "${YELLOW}Escolha uma opção: ${NC}"
    read -r option
}

# ============================================
# FUNÇÕES DE INSTALAÇÃO
# ============================================

# Função para instalar linguagens
install_languages() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              📚 INSTALANDO LINGUAGENS DE PROGRAMAÇÃO          ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    log "Iniciando instalação de linguagens"
    
    # Python
    install_with_desc "Python" \
        "Linguagem versátil para scripts, automação, IA, desenvolvimento web e ciência de dados. A mais completa para iniciantes." \
        "python"
    
    install_with_desc "PIP" \
        "Gerenciador de pacotes do Python. Permite instalar milhares de bibliotecas como Django, Flask, TensorFlow, etc." \
        "python-pip"
    
    # Pacotes Python
    install_python_pkg "requests" \
        "Biblioteca para fazer requisições HTTP. Perfeita para web scraping, APIs, e automação de navegação."
    
    install_python_pkg "beautifulsoup4" \
        "Parsing de HTML/XML para extrair dados de websites. Essencial para raspagem de dados."
    
    install_python_pkg "numpy" \
        "Biblioteca para computação científica e operações matemáticas com arrays. Base para machine learning."
    
    install_python_pkg "pandas" \
        "Manipulação e análise de dados. Ideal para trabalhar com planilhas, CSV e análise de dados."
    
    install_python_pkg "colorama" \
        "Cores no terminal Python. Deixa seus scripts mais bonitos e profissionais."
    
    # Node.js
    install_with_desc "Node.js" \
        "JavaScript no servidor. Essencial para desenvolvimento web moderno, APIs, e ferramentas como React, Vue e Angular." \
        "nodejs"
    
    # Ruby
    install_with_desc "Ruby" \
        "Linguagem elegante para automação, servidores locais, e ferramentas como Jekyll (blogs estáticos)." \
        "ruby"
    
    # PHP
    install_with_desc "PHP" \
        "Linguagem para desenvolvimento web. 80% da internet usa PHP, incluindo WordPress, Laravel e sistemas como Moodle." \
        "php"
    
    # Clang (C/C++)
    install_with_desc "Clang (C/C++)" \
        "Compilador para programação de sistemas, jogos, e aplicações de alta performance. Essencial para programadores de baixo nível." \
        "clang"
    
    # Java
    install_with_desc "Java (OpenJDK-17)" \
        "Linguagem para aplicações Android, sistemas corporativos, e desenvolvimento de jogos. Roda em bilhões de dispositivos." \
        "openjdk-17"
    
    echo -e "${GREEN}✓ Todas as linguagens foram instaladas!${NC}\n"
    log "Instalação de linguagens concluída"
}

# Função para instalar ferramentas de rede
install_network() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              🌐 INSTALANDO FERRAMENTAS DE REDE               ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    log "Iniciando instalação de ferramentas de rede"
    
    # Nmap
    install_with_desc "Nmap" \
        "Scanner de portas e redes. Descubra dispositivos conectados, portas abertas e serviços rodando na sua rede local." \
        "nmap"
    
    # OpenSSH
    install_with_desc "OpenSSH" \
        "Acesso remoto seguro. Permite conectar em servidores ou transformar seu celular em um servidor SSH." \
        "openssh"
    
    # Netcat
    install_with_desc "Netcat (nc)" \
        "Canivete suíço das redes. Debug de conexões, transferência de arquivos e backdoors para testes." \
        "netcat-openbsd"
    
    # Wget
    install_with_desc "Wget" \
        "Baixa arquivos da internet. Suporte a recursão, resume downloads e funciona em segundo plano." \
        "wget"
    
    # Curl
    install_with_desc "Curl" \
        "Faz requisições HTTP/HTTPS. Perfeito para testar APIs, baixar arquivos e automação web." \
        "curl"
    
    # Tor
    install_with_desc "Tor" \
        "Navegação anônima. Roteia seu tráfego por múltiplos servidores para privacidade e anonimato." \
        "tor"
    
    # Traceroute
    install_with_desc "Traceroute" \
        "Rastreia a rota dos pacotes até um destino. Descubra por onde seus dados trafegam na internet." \
        "traceroute"
    
    # WhoIs
    install_with_desc "WhoIs" \
        "Consulta informações de domínios. Descubra quem é o dono de um site, data de registro e mais." \
        "whois"
    
    # Hydra (opcional - perguntar)
    if ask_yes_no "Instalar Hydra (ferramenta de brute-force para testes de segurança)?"; then
        install_with_desc "Hydra" \
            "Ferramenta de brute-force para testes de segurança. Testa senhas em SSH, FTP, HTTP, etc." \
            "hydra"
    fi
    
    # Metasploit (opcional - perguntar)
    if ask_yes_no "Instalar Metasploit (framework de segurança - PESADO ~300MB)?"; then
        echo -e "${YELLOW}⚠ Instalando repositórios extras...${NC}"
        pkg install unstable-repo -y > /dev/null 2>&1
        install_with_desc "Metasploit" \
            "Framework completo para testes de invasão e segurança. Mais de 1500 exploits." \
            "metasploit"
    fi
    
    echo -e "${GREEN}✓ Ferramentas de rede instaladas!${NC}\n"
    log "Instalação de ferramentas de rede concluída"
}

# Função para instalar utilitários
install_utilities() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              🔧 INSTALANDO UTILITÁRIOS E FERRAMENTAS         ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    log "Iniciando instalação de utilitários"
    
    # Htop
    install_with_desc "Htop" \
        "Monitor de processos interativo. Veja CPU, RAM, e mate processos com poucos cliques. Melhor que o top tradicional." \
        "htop"
    
    # Git
    install_with_desc "Git" \
        "Controle de versão. Baixe projetos do GitHub, controle seu código e colabore com outros devs." \
        "git"
    
    # Nano
    install_with_desc "Nano" \
        "Editor de texto simples. Perfeito para iniciantes, com comandos visíveis na tela." \
        "nano"
    
    # Vim
    install_with_desc "Vim" \
        "Editor de texto avançado. Extremamente poderoso, com modos de edição e centenas de plugins." \
        "vim"
    
    # Tmux
    install_with_desc "Tmux" \
        "Multiplexador de terminal. Divida a tela em múltiplos terminais, rode processos em background e nunca perca sessões." \
        "tmux"
    
    # Tree
    install_with_desc "Tree" \
        "Visualiza estrutura de pastas. Mostra hierarquia de diretórios em formato de árvore." \
        "tree"
    
    # Ranger
    install_with_desc "Ranger" \
        "Gerenciador de arquivos no terminal. Navegue, copie, mova e visualize arquivos com atalhos de teclado." \
        "ranger"
    
    # FFmpeg
    install_with_desc "FFmpeg" \
        "Processador de áudio e vídeo. Converta, corte, redimensione e edite mídias diretamente no terminal." \
        "ffmpeg"
    
    # Neofetch
    install_with_desc "Neofetch" \
        "Mostra informações do sistema com arte ASCII. Perfeito para prints e personalização." \
        "neofetch"
    
    # Cmatrix
    install_with_desc "Cmatrix" \
        "Efeito Matrix no terminal. Aquele visual de chuva de código verde." \
        "cmatrix"
    
    # Termux-API
    install_with_desc "Termux-API" \
        "Acessa recursos do Android. Bateria, câmera, notificações, sensores e mais via terminal." \
        "termux-api"
    
    # Zsh
    install_with_desc "Zsh" \
        "Shell avançado com autocomplete inteligente, temas e plugins. Mais poderoso que o bash." \
        "zsh"
    
    echo -e "${GREEN}✓ Utilitários instalados!${NC}\n"
    log "Instalação de utilitários concluída"
}

# ============================================
# FUNÇÕES DE CONFIGURAÇÃO
# ============================================

# Função para configurar Zsh com Oh My Zsh
setup_zsh() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              🎨 CONFIGURANDO ZSH E OH MY ZSH                ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    log "Configurando Zsh e Oh My Zsh"
    
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${YELLOW}⚠ Oh My Zsh já está instalado${NC}\n"
    else
        echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
        echo -e "${BLUE}│${NC} ${BOLD}🎨 Instalando: ${WHITE}Oh My Zsh${NC}"
        echo -e "${BLUE}│${NC} ${YELLOW}📖 Descrição:${NC} Framework para gerenciar configurações do Zsh"
        echo -e "${BLUE}│${NC}   Com plugins, temas e aliases que aumentam produtividade"
        echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
        
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ Oh My Zsh instalado!${NC}\n"
            log "Oh My Zsh instalado com sucesso"
            
            # Configurar tema
            echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
            echo -e "${BLUE}│${NC} ${BOLD}🎨 Configurando tema: ${WHITE}agnoster${NC}"
            echo -e "${BLUE}│${NC} ${YELLOW}📖 Descrição:${NC} Tema bonito com informações do Git na linha de comando"
            echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
            
            sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' "$HOME/.zshrc"
            echo -e "${GREEN}✓ Tema configurado!${NC}\n"
            log "Tema agnoster configurado"
        else
            echo -e "${RED}✗ Falha ao instalar Oh My Zsh${NC}\n"
            log "Falha ao instalar Oh My Zsh"
        fi
    fi
}

# Função para configurar aliases
setup_aliases() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              ⚡ CONFIGURANDO ALIASES PERSONALIZADOS          ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    log "Configurando aliases personalizados"
    
    # Verificar se os aliases já existem
    if grep -q "# TERMUX POWER SETUP ALIASES" "$HOME/.bashrc"; then
        echo -e "${YELLOW}⚠ Aliases já configurados anteriormente${NC}\n"
        return
    fi
    
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
    echo -e "${BLUE}│${NC} ${BOLD}⚡ Criando aliases no .bashrc${NC}"
    echo -e "${BLUE}│${NC} ${YELLOW}📖 Descrição:${NC} Atalhos para comandos mais usados"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
    
    cat >> "$HOME/.bashrc" << 'EOF'

# ============================================
# TERMUX POWER SETUP ALIASES
# ============================================

# Navegação
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Gerenciamento do Termux
alias update='pkg update && pkg upgrade -y'
alias install='pkg install'
alias search='pkg search'
alias remove='pkg remove'
alias list='pkg list-installed'

# Python
alias py='python'
alias py3='python3'
alias pip='pip install'
alias pip3='pip3 install'

# Informações do sistema
alias ipinfo='curl ipinfo.io'
alias weather='curl wttr.in'
alias sysinfo='neofetch'
alias processes='htop'
alias storage='df -h'
alias memory='free -h'
alias battery='termux-battery-status'

# Editores
alias edit='nano'
alias vi='vim'

# Diversão e estética
alias matrix='cmatrix'
alias matrix-fast='cmatrix -s -u 3'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph'

# Rede
alias myip='curl -s ifconfig.me'
alias localip='ip addr show | grep inet'

# ============================================
EOF

    echo -e "${GREEN}✓ Aliases configurados!${NC}"
    echo -e "${CYAN}  • ll = lista detalhada"
    echo -e "  • update = atualiza o sistema"
    echo -e "  • ipinfo = mostra informações de IP"
    echo -e "  • weather = previsão do tempo"
    echo -e "  • sysinfo = informações do sistema"
    echo -e "  • battery = status da bateria${NC}\n"
    
    log "Aliases configurados com sucesso"
}

# Função para criar diretórios
setup_directories() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              📁 CRIANDO ESTRUTURA DE DIRETÓRIOS            ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    log "Criando estrutura de diretórios"
    
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
    echo -e "${BLUE}│${NC} ${BOLD}📁 Criando diretórios organizados${NC}"
    echo -e "${BLUE}│${NC} ${YELLOW}📖 Descrição:${NC} Estrutura para manter seus projetos organizados"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
    
    mkdir -p "$HOME/projetos"
    mkdir -p "$HOME/scripts"
    mkdir -p "$HOME/tools"
    mkdir -p "$HOME/backups"
    mkdir -p "$HOME/.config"
    
    # Criar arquivos README em cada diretório
    echo "# Projetos" > "$HOME/projetos/README.md"
    echo "# Scripts" > "$HOME/scripts/README.md"
    echo "# Tools" > "$HOME/tools/README.md"
    echo "# Backups" > "$HOME/backups/README.md"
    
    echo -e "${GREEN}✓ Diretórios criados:${NC}"
    echo -e "  📁 ~/projetos  → Seus projetos de código"
    echo -e "  📁 ~/scripts   → Scripts e automações"
    echo -e "  📁 ~/tools     → Ferramentas baixadas"
    echo -e "  📁 ~/backups   → Backups de configurações\n"
    
    log "Diretórios criados com sucesso"
}

# Função para configurar arquivo de log
setup_log() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              📝 CONFIGURANDO SISTEMA DE LOG                ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────${NC}"
    echo -e "${BLUE}│${NC} ${BOLD}📝 Criando arquivo de log em: $LOG_FILE${NC}"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────${NC}"
    
    touch "$LOG_FILE"
    echo -e "${GREEN}✓ Sistema de log configurado!${NC}\n"
    
    log "========================================="
    log "Termux Power Setup v$VERSION iniciado"
    log "========================================="
}

# ============================================
# FUNÇÕES DE RESUMO E FINALIZAÇÃO
# ============================================

# Função para mostrar resumo final
show_final_summary() {
    echo -e "\n${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${GREEN}              ✅ INSTALAÇÃO CONCLUÍDA COM SUCESSO!           ${NC}"
    echo -e "${BOLD}${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    echo -e "${BOLD}${WHITE}📊 RESUMO DAS FERRAMENTAS INSTALADAS:${NC}\n"
    
    echo -e "${CYAN}🐍 LINGUAGENS:${NC}"
    echo "   • Python 3.x      → Scripts, automação, IA, web scraping"
    echo "   • Node.js         → JavaScript no servidor, React, Vue"
    echo "   • Ruby            → Automação, Jekyll, servidores"
    echo "   • PHP             → WordPress, Laravel, sites dinâmicos"
    echo "   • C/C++ (Clang)   → Programação de sistemas, jogos"
    echo "   • Java (OpenJDK)  → Apps Android, sistemas corporativos"
    
    echo -e "\n${CYAN}🌐 REDE:${NC}"
    echo "   • Nmap            → Scanner de portas e redes"
    echo "   • OpenSSH         → Acesso remoto seguro"
    echo "   • Netcat          → Debug de conexões"
    echo "   • Wget/Curl       → Downloads e requisições HTTP"
    echo "   • Tor             → Navegação anônima"
    echo "   • Traceroute      → Rota de pacotes"
    echo "   • WhoIs           → Consulta de domínios"
    
    echo -e "\n${CYAN}🔧 UTILITÁRIOS:${NC}"
    echo "   • Htop            → Monitor de processos"
    echo "   • Git             → Controle de versão"
    echo "   • Nano/Vim        → Editores de texto"
    echo "   • Tmux            → Múltiplos terminais"
    echo "   • Tree            → Estrutura de pastas"
    echo "   • Ranger          → Gerenciador de arquivos"
    echo "   • FFmpeg          → Processador de mídia"
    echo "   • Neofetch        → Info do sistema"
    echo "   • Cmatrix         → Efeito Matrix"
    echo "   • Zsh + Oh My Zsh → Terminal turbinado"
    
    echo -e "\n${BOLD}${GREEN}💡 COMANDOS ÚTEIS PARA COMEÇAR:${NC}"
    echo -e "  • ${YELLOW}sysinfo${NC}      → Mostra informações do sistema"
    echo -e "  • ${YELLOW}matrix${NC}       → Efeito Matrix"
    echo -e "  • ${YELLOW}ipinfo${NC}       → Mostra seu IP público"
    echo -e "  • ${YELLOW}weather${NC}      → Previsão do tempo"
    echo -e "  • ${YELLOW}update${NC}       → Atualiza todos os pacotes"
    echo -e "  • ${YELLOW}battery${NC}      → Status da bateria"
    echo -e "  • ${YELLOW}zsh${NC}          → Ativa o shell melhorado"
    echo -e "  • ${YELLOW}cd ~/storage/downloads${NC} → Acessa seus arquivos"
    
    echo -e "\n${BOLD}${YELLOW}⚠ IMPORTANTE:${NC}"
    echo -e "  • Reinicie o Termux para aplicar todas as configurações"
    echo -e "  • Para usar Zsh como padrão: ${CYAN}chsh -s zsh${NC}"
    echo -e "  • Configure sua senha SSH: ${CYAN}passwd${NC}"
    echo -e "  • Log de instalação disponível em: ${CYAN}$LOG_FILE${NC}"
    
    echo -e "\n${BOLD}${GREEN}🚀 Seu Termux está pronto para uso! Divirta-se!${NC}"
    echo -e "${BOLD}${CYAN}🔗 GitHub: https://github.com/seuusuario/termux-power-setup${NC}\n"
    
    log "Instalação concluída com sucesso"
}

# ============================================
# FUNÇÃO PRINCIPAL
# ============================================

main() {
    # Verificar se está no Termux
    if [[ ! -d /data/data/com.termux ]]; then
        echo -e "${RED}✗ Este script deve ser executado no Termux!${NC}"
        exit 1
    fi
    
    # Configurar log
    setup_log
    
    # Verificar conexão com internet
    echo -e "${BLUE}🌐 Verificando conexão com internet...${NC}"
    if ! ping -c 1 google.com > /dev/null 2>&1; then
        echo -e "${RED}✗ Sem conexão com internet. Verifique sua rede.${NC}"
        exit 1
    fi
    echo -e "${GREEN}✓ Conexão com internet OK!${NC}\n"
    
    # Atualizar pacotes
    echo -e "${BLUE}📦 Atualizando lista de pacotes...${NC}"
    pkg update -y > /dev/null 2>&1
    echo -e "${GREEN}✓ Lista de pacotes atualizada!${NC}\n"
    
    # Configurar storage
    if [ ! -d "$HOME/storage" ]; then
        echo -e "${BLUE}📁 Configurando acesso ao storage do Android...${NC}"
        echo -e "${YELLOW}⚠ Será aberta uma janela solicitando permissão${NC}"
        termux-setup-storage
        sleep 3
        echo -e "${GREEN}✓ Storage configurado!${NC}\n"
    fi
    
    # Mostrar menu
    show_menu
    
    case $option in
        1)
            install_languages
            install_network
            install_utilities
            setup_zsh
            setup_aliases
            setup_directories
            show_final_summary
            ;;
        2)
            install_languages
            echo -e "\n${GREEN}✓ Instalação concluída!${NC}"
            ;;
        3)
            install_network
            echo -e "\n${GREEN}✓ Instalação concluída!${NC}"
            ;;
        4)
            install_utilities
            if ask_yes_no "Configurar Zsh + Oh My Zsh?"; then
                setup_zsh
            fi
            if ask_yes_no "Configurar Aliases?"; then
                setup_aliases
            fi
            if ask_yes_no "Criar diretórios (projetos, scripts, tools)?"; then
                setup_directories
            fi
            echo -e "\n${GREEN}✓ Instalação concluída!${NC}"
            ;;
        5)
            echo ""
            if ask_yes_no "Instalar Linguagens de Programação?"; then
                install_languages
            fi
            if ask_yes_no "Instalar Ferramentas de Rede?"; then
                install_network
            fi
            if ask_yes_no "Instalar Utilitários?"; then
                install_utilities
            fi
            if ask_yes_no "Configurar Zsh + Oh My Zsh?"; then
                setup_zsh
            fi
            if ask_yes_no "Configurar Aliases?"; then
                setup_aliases
            fi
            if ask_yes_no "Criar diretórios (projetos, scripts, tools)?"; then
                setup_directories
            fi
            echo -e "\n${GREEN}✓ Instalação concluída!${NC}"
            ;;
        0)
            echo -e "${YELLOW}Saindo...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Opção inválida!${NC}"
            exit 1
            ;;
    esac
    
    log "Script finalizado"
}

# Executar script
main
