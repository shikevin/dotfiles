#PS1='\[\033[0;31m\]\w \[\033[0;32m\]\u\[\033[0;34m\]$\[\033[0;37m\]'
# Git branch in prompt.

alias grp="grep -irn"

alias find="sudo find / -name"

parse_git_branch() {

        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}
#\W\[\033[32m\]
export PS1="\[\033[0;31m\]\w \[\033[0;32m\]\u\[\033[0;34m\]\$(parse_git_branch)\[\033[00m\]$ "

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
