#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

local pathdirs

# Create a list of directories to add to the path
# gnubin contains coreutils without the g prefix
pathdirs=(
    /usr/local/bin
    /usr/local/sbin
    $HOME/bin
    $HOME/.rbenv/bin
    /usr/local/opt/coreutils/libexec/gnubin
    $HOME/.rvm/bin
    /opt/cross/bin
    $HOME/.cargo/bin
    `yarn global bin`
    `pyenv root`/shims
    /usr/local/opt/llvm/bin
)

# Add directories which exist to the path
for dir ($pathdirs) {
    if [[ -d $dir ]]; then
        path=($dir $path)
    fi
}

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

#
# Miscellaneous
#

# Load super secret stuff
[[ -s $HOME/.secrets ]] && source $HOME/.secrets

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source /usr/local/bin/activate.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
