ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mojo"

plugins=( brew gem git git-flow git-wtf history-substring-search knife rails3 rvm tmuxinator )

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/data/bin:$PATH

source $ZSH/oh-my-zsh.sh

if [ -f ~/.exports ]; then
  source ~/.exports
fi

umask 022
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Colors
autoload -U colors
colors
setopt prompt_subst

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# enable colored output from ls, etc
export CLICOLOR=1

setopt auto_cd

setopt prompt_subst # expand functions in the prompt
setopt histignoredups # ignore duplicate history entries
export HISTSIZE=4096 # keep TONS of history
setopt auto_pushd # automatically pushd
export dirstacksize=5
setopt AUTOCD # awesome cd movements from zshkit
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars
setopt CORRECT CORRECT_ALL # Try to correct command line spelling
setopt EXTENDED_GLOB # Enable extended globbing

autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema \
'[[ $words[1] == scp ]] && reply=("*") || reply=(http https ftp)'

setopt NO_NOMATCH
DISABLE_AUTO_TITLE=true

