if [[ ! -f ~/.antigen/antigen.zsh ]]; then
    mkdir -p ~/.antigen/
    curl -L git.io/antigen > ~/.antigen/antigen.zsh
fi
source ~/.antigen/antigen.zsh


antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen theme robbyrussell

antigen apply


bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
alias ls='exa -la --icons --header'
alias ccd='clear && cd' 


mcd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}
