# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE=kvantum

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

### User configuration ###

# Path settings
export EDITOR=nvim
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/home/felixsouzaps/.local/bin

# export JAVA_HOME=/usr/lib/jvm/java-22-openjdk
# export PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export PATH="$HOME/.local/bin":$PATH

export PATH="$HOME/.composer/vendor/bin:$PATH"

source /usr/share/nvm/init-nvm.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH="/home/felixoakz/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/felixoakz/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"




# ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
# █░▄▄▀█░███▄██░▄▄▀█░▄▄█░▄▄█░▄▄██
# █░▀▀░█░███░▄█░▀▀░█▄▄▀█░▄▄█▄▄▀██
# █▄██▄█▄▄█▄▄▄█▄██▄█▄▄▄█▄▄▄█▄▄▄██
# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

alias cat='bat'
alias timeshift='sudo -E timeshift-launcher'
alias count='ls -1 | wc -l'
alias fzf='fzf --preview="bat --color=always {}"'
alias nfzf='nvim $(fzf --preview="bat --color=always {}")'
alias nfzfm='nvim $(fzf -m --preview="bat --color=always {}")'
alias hosts='nvim /etc/hosts'
alias icat="kitten icat"

# Alias to search for a specific string in the current directory
# It finds all files in the current directory and its subdirectories
# Then it uses grep to search for the string inside those files
alias sgrep='find . -type f -exec grep -l "$1" {} +'

# Explanation:
# find .          - Search in the current directory ('.') and its subdirectories
# -type f         - Only look for files (ignore directories)
# -exec grep -l   - For each file found, execute the grep command to search for the string
# "$1"            - The first argument passed to the alias (the string to search for)
# {}              - Placeholder for the current file found by the 'find' command
# +               - Run grep on multiple files at once for efficiency

# Workspaces
alias play='cd ~/projects/playcheap/ && tmux new -s play'
alias vendas='cd ~/projects/vendas/ && tmux new -s vendas'
alias neti='cd ~/projects/netinove && tmux new -s netinove'
alias gouveia='cd ~/projects/sistema_gouveia && tmux new -s gouveia'
alias fserv='cd ~/projects/fserver && tmux new -s fserver'


