#
# Set up path variables
#
# Note: it doesn't matter if directories in the lists don't exist, as they
# won't be added to the path unless they do.
#

local mandirs funcdirs helpdirs

export PATH

# Allow Homebrew/MacPorts man pages and others
# gnuman contains manpages for coreutils without the g prefix
mandirs=(
    /usr/local/git/man
    /opt/local/man
    /usr/local/man
    /usr/local/opt/coreutils/libexec/gnuman
    $HOME/Library/Documentation/Local/man
)

# Add directories which exist to the manpath
for dir ($mandirs) {
  if [[ -x $dir ]]; then
    manpath=($manpath $dir)
  fi
}

# Add function paths
local binary=$(which zsh)
local install_path=$binary:h:h # Strip bin/zsh to find installation path.

funcdirs=(
    $HOME/.zsh/func 
    $install_path/share/zsh/$ZSH_VERSION/functions
    $install_path/share/zsh/functions
    $install_path/share/zsh/site-functions
    /usr/share/zsh/$ZSH_VERSION/functions
    /usr/share/zsh/functions
    /usr/share/zsh/site-functions
    /usr/share/zsh-completions
    /usr/local/share/zsh-completions
)

# Add existing function directories to the fpath
for dir ($funcdirs) {
  if [[ -x $dir ]]; then
    fpath=($fpath $dir)
  fi
}

# Directories for run-help: see 03_help.
helpdirs=(
    $HOME/.zsh/help
    $install_path/share/zsh/$ZSH_VERSION/zsh_help
    $install_path/share/zsh/zsh_help
    /usr/share/zsh/$ZSH_VERSION/zsh_help
    /usr/share/zsh/zsh_help
)

for dir ($helpdirs) {
  if [[ -x $dir ]]; then
    helpdir=($fpath $dir)
  fi
}

typeset -gU cdpath manpath fpath helpdir

# vim: set syn=zsh:
