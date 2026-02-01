# ==============================================================================
# ZSH CONFIGURATION
# ==============================================================================
# Main configuration file for Zsh.
#
# Structure:
# 1. Environment Variables
# 2. Oh My Zsh Configuration
# 3. Completions & Integrations
# 4. Functions & Automation
# 5. Aliases
# 6. External Configurations
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. ENVIRONMENT VARIABLES
# ------------------------------------------------------------------------------

# Set language environment
export LANG=en_US.UTF-8

# Set default editor
export EDITOR='nvim'

# OpenCode Path
export PATH="$HOME/.opencode/bin:$PATH"

# ------------------------------------------------------------------------------
# 2. OH MY ZSH CONFIGURATION
# ------------------------------------------------------------------------------

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="af-magic"

# Plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh (loads OMZ, plugins, and theme)
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------------------
# 3. COMPLETIONS & INTEGRATIONS
# ------------------------------------------------------------------------------

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"

# ------------------------------------------------------------------------------
# 4. FUNCTIONS & AUTOMATION
# ------------------------------------------------------------------------------

# --- Tmux Auto-Start ---
# Automatically start or attach to a tmux session on terminal launch.

# Helper: Find the lowest-numbered available tmux session (1-100)
get_free_tmux_session() {
  local sessions
  sessions=($(tmux ls 2>/dev/null | cut -d: -f1))
  for i in {1..100}; do
    if [[ ! " ${sessions[*]} " =~ " ${i} " ]]; then
      echo "$i"
      return
    fi
  done
  echo 1 # Default to 1 if fully occupied
}

# Logic: Start/Attach if not inside tmux
if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
  session=$(get_free_tmux_session)
  exec tmux new -s "$session"
fi

# --- Docker Helpers ---
dshell() { docker exec -it "$1" bash; } # Open bash in container

# ------------------------------------------------------------------------------
# 5. ALIASES
# ------------------------------------------------------------------------------

# --- General Utilities ---
alias lg='lazygit'
alias gg='gemini'
alias cat='bat'
alias count='ls -1 | wc -l'                 # Count files
alias copy='xclip -selection clipboard <'   # Copy file content

# --- Hardware & Mounts ---
alias listusb='lsblk -S | grep -i usb'
alias listmounts='lsblk -o NAME,SIZE,TYPE,MOUNTPOINT'
alias trimall='sudo fstrim -av'

# --- System & Package Management (Arch) ---
alias update='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
alias pac-list-installed='pacman -Qe'

# Cleanup
alias pac-clean-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias pac-clean-cache='sudo pacman -Sc'
alias pac-clean-all='pac-clean-cache && pac-clean-orphans'
alias yay-clean='yay -Sc --noconfirm'

# --- Systemd ---
alias systemctl-list-units='systemctl list-units --type=service'
alias systemctl-list-enabled='systemctl list-unit-files --state=enabled'
alias systemctl-list-all='systemctl list-units --all --type=service'

# --- Docker ---

# Listing
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dvol='docker volume ls'
alias dnet='docker network ls'
alias dlogs='docker compose logs -f'

# Operations (Single)
alias dstop='docker stop $(docker ps -q)'   # Stop all running
alias drcon='docker rm -f'                  # Remove container: drcon <id>
alias drimg='docker rmi -f'                 # Remove image: drimg <id>
alias drvol='docker volume rm'              # Remove volume: drvol <name>
alias drnet='docker network rm'             # Remove network: drnet <name>

# Cleanup (Prune)
alias dprune='docker system prune -f'            # Prune unused (containers, net, img)
alias dprunevol='docker system prune -f --volumes' # Prune + volumes
alias dimageprune='docker image prune -f'        # Prune dangling images
alias dvolprune='docker volume prune -f'         # Prune unused volumes
alias dnetprune='docker network prune -f'        # Prune unused networks
alias dclean='docker system prune -a --volumes'  # Aggressive prune

# Mass Destruction (All)
# Renamed from 'drcon' to 'drcon-all' to avoid conflict with single removal aliases
alias drcon-all='docker rm -f $(docker ps -aq)'
alias drvol-all='docker volume rm $(docker volume ls -q)'
alias drimg-all='docker rmi -f $(docker images -q)'
alias dnuke='drcon-all && drvol-all && drimg-all'

# --- Laravel ---
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias rector='php -d memory_limit=512M ./vendor/bin/rector'
alias stan='php -d memory_limit=512M ./vendor/bin/phpstan analyse --ansi'
alias pint='php -d memory_limit=512M ./vendor/bin/pint'

# ------------------------------------------------------------------------------
# 6. EXTERNAL CONFIGURATIONS
# ------------------------------------------------------------------------------

# Omarchy Extras (Aliases, Tools, ISO helpers)
if [[ -f ~/.zshextras ]]; then
  source ~/.zshextras
fi
