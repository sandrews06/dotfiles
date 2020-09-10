
# stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts
if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi

# Add commonly used folders to $PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"


# ZSH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/dotfiles/dotfiles/oh-my-zsh/.oh-my-zsh"
#ZSH_THEME="agnoster"

plugins=(wd git colored-man-pages colorize brew osx themes node zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias ls='ls -aFhlG'
alias less='less -FSRXc'
alias sudo='sudo '

cd() { builtin cd "$@"; ll; }

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

alias hosts='sudo code /etc/hosts'
alias src='. ~/.zshrc'
alias rmds="find . -name '*.DS_Store' -type f -delete"
alias iphone='open -a "iOS Simulator"'

alias dclean="docker rmi $(docker images | grep '^<none>' | awk '{ print $3 }')"
alias qfind="find . -name "                 # qfind:    Quickly search for file



#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
          esac
      else
          echo "'$1' is not a valid file"
      fi
}



ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string



# Java Multiple versions.
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
