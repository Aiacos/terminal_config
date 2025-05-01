# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "wintermi/zsh-brew"
plug "wintermi/zsh-lsd"
plug "yuhonas/zsh-aliases-lsd"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
plug "tm4Bit/fzf-zellij"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export POSH_THEME="$HOME/.config/oh-my-posh/themes/powerlevel10k_rainbow.omp.json"
plug "wintermi/zsh-oh-my-posh"

# Load and initialise completion system
autoload -Uz compinit
compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"

# Define utility functions and aliases
backup_with_timestamp() {
    # Creates a timestamped backup of the given file or directory
    BACKUP_NAME="$1_backup_$(date +%Y-%m-%d_%H:%M:%S)"
    cp -r "$1" "$BACKUP_NAME"
    echo "Created backup at \"./$BACKUP_NAME\""
    unset BACKUP_NAME
}
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# User Config
source /etc/os-release
if [[ "$PRETTY_NAME" == *"Fedora"* ]]; then
    # Nothing for Fedora
elif [[ "$PRETTY_NAME" == *"Ubuntu"* ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
    alias bat="batcat"
elif [[ "$PRETTY_NAME" == *"Debian"* ]]; then
    # echo "Brew not working in Debian for Rasberry"
    alias bat="batcat"
    alias nvim="/snap/bin/nvim"
    alias lazygit="/snap/bin/lazygit"
    alias rclone="/snap/bin/rclone"
else
    # echo "System is not Fedora nor Ubuntu nor Debian."
fi
