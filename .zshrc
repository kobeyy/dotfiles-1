
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload bashcompinit
bashcompinit
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=false
ZSH_THEME="powerlevel10k/powerlevel10k"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    zsh-autosuggestions
    history
    nmap
    kubectl)

fpath=( ~/.functions "${fpath[@]}" )

source $ZSH/oh-my-zsh.sh

# Colors:
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Large history file
## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=5000000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=1000000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data


zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

# Remove hostname:
prompt_context() {} 

# export MANPATH="/usr/local/man:$MANPATH"
ZSH_CUSTOM=$ZSH/custom

# source all files
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_go ]; then
    . ~/.bash_go
fi

if [ -f ~/.bash_aws ]; then
    . ~/.bash_aws
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
