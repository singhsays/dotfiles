# Path setup
set -gx PATH $PATH /usr/local/sbin /usr/local/bin /usr/local/go/bin
set -g fish_user_paths $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $fish_user_paths

# Aliases
alias rf "rm -Rf"
alias gst "git status -sb"
alias dock "DOCKER_BUILDKIT=1 docker"
alias dockc "COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose"

# OS Specific configuration
switch (uname)
  case Linux
    set PATH $PATH /apps
  case Darwin
    set -g fish_user_paths $HOME/.homebrew/bin $fish_user_paths
  case '*'
end

# tmux
if type -sq tmux
  alias tl "tmux list-sessions"
  alias ta "tmux attach-session -t "
  alias tn "tmux new-session -s "
end

# pnpm
if type -sq pnpm
  alias pn "pnpm"
  set -gx PNPM_HOME "$HOME/.local/share/pnpm"
  if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
  end
end

# conda
if type -sq conda
  eval $(which conda) "shell.fish" "hook" $argv | source
end

# Use starship if available
if type -sq starship
  starship init fish | source
end

