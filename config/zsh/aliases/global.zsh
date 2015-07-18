# ls
alias ls='ls --group-directories-first --color=auto --classify' # classify symbols

# modified commands
alias grep='grep -i'
alias ag='ag -i'
alias du1='du --max-depth=1'
alias mkdir='nocorrect mkdir -pv'
alias ping='ping -c 4'

# I don't like interactive commands
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias ln='nocorrect ln'

# privileged access
alias sudo='sudo '
alias root='sudo su'
alias reboot='sudo reboot'
alias halt='sudo halt'

alias s="reattach-to-user-namespace subl"
alias g="git"
alias tmux="tmux -2 -u"
alias rsyncp='rsync -avz -e ssh --progress --partial '

if type mvim > /dev/null; then
	alias vim="mvim -v"
fi

alias hanzik="ssh hanzik -t -- /bin/sh -c 'tmux has-session && exec tmux attach || exec tmux'"

# suffix aliases
# These are cool, following the alias below if I write
# `$ a_tex_doc.tex<Tab>`
# Will expand to:
# `$ vim a_tex_doc.tex`
# See more: man zshbuiltins - aliases
# alias -s tex=vim

if [[ $OSTYPE[1,6] == "darwin" ]]; then
  for s in mp3 wav aac \
    ogg avi mp4 m4v mov qt mpg mpeg \
    jpg jpeg png psd bmp gif tif tiff \
    eps ps pdf html dmg; do
    alias -s $s=open
  done
fi

# useful pipe aliases
# kudos to zsh-lovers
# now in evaluation...

# # |& -> 2>&1 => connects stdout and stderr to the stdin (man zshmisc)
# alias -g DN=/dev/null
# alias -g EG='|& egrep'
# alias -g EH='|& head'
# alias -g EL='|& less'
# alias -g ELS='|& less -S'
# alias -g ET='|& tail'
# alias -g ETL='|& tail -20'
# alias -g F=' | fmt -'
# alias -g G='| grep'
# alias -g H='| head'
# alias -g HL='|& head -20'
# alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
# alias -g LL="2>&1 | less"
# alias -g L="| less"
# alias -g LS='| less -S'
# alias -g MM='| most'
# alias -g M='| more'
# alias -g NE="2> /dev/null"
# alias -g NS='| sort -n'
# alias -g NUL="> /dev/null 2>&1"
# alias -g PIPE='|'
# alias -g R=' > /c/aaa/tee.txt '
# alias -g RNS='| sort -nr'
# alias -g S='| sort'
# alias -g TL='| tail -20'
# alias -g T='| tail'
# alias -g US='| sort -u'
# alias -g VM=/var/log/messages
# alias -g X0G='| xargs -0 egrep'
# alias -g X0='| xargs -0'
# alias -g XG='| xargs egrep'
# alias -g X='| xargs'
