## Setup Oh my ZSH
#ZSH_THEME="terminalparty"
ZSH_THEME="aussiegeek"
#ZSH_THEME="pie"
#
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.


ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
plugins=(autojump git svn python ssh-agent brew brew-cask colored-man docker gnu-utils tmux \
    httpie jsontools lol vundle taskwarrior fzf terraform)

export EDITOR=vim
#export VMWARE_SERVER=vmware-test.oit.duke.edu
#export HOMEBREW_GITHUB_API_TOKEN=$(lpass show HOMEBREW_GITHUB_API_TOKEN --password)
## Helpful aliases
#export HOMESERVER=$(lpass show homeserver --notes)
#export FAVORITEHOST=$(lpass show favoritehost --notes)

alias ppjson="python -mjson.tool"

alias ag="ag --pager='less -FXRS'"
alias k="kubectl"
alias ka='f(){ kubectl "$@" --all-namespaces -o wide;  unset -f f; }; f'
alias nkssh='ssh -o PubkeyAuthentication=no'
alias grep='nocorrect grep --color=auto'
alias whatd_i_do_last_week="task end.after:today-1wk completed rc.detection:off rc.defaultwidth:184"
alias whatd_i_do_last_month="task end.after:today-5wk completed rc.detection:off rc.defaultwidth:184"
alias whatd_i_do_last_day="task end.after:today-1d completed rc.detection:off rc.defaultwidth:184"
alias setup_vim='git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; vim +BundleInstall +qall'
alias use_clockworks_test='export CLOCKWORKS_BASE_URL=https://clockworks-test.oit.duke.edu'
alias use_clockworks_prod='export CLOCKWORKS_BASE_URL=https://clockworks.oit.duke.edu'
alias use_clockworks_liz='export CLOCKWORKS_BASE_URL=https://clockworks-dev-liz.oit.duke.edu'
alias dangitbobby='fuck'
alias super-oc="oc --as=system:admin"

# Open shifty stuff
alias podr="oc get pods | grep Running"
#alias update_hosts_completion='cmdb-cli.py ssi-windows > ~/.ssi-windows'


## Setup PATH
if which brew &>/dev/null; then
    export PATH=$(brew --prefix ruby)/bin:$PATH
fi
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=$PATH:/var/lib/gems/1.8/bin:/sbin:/usr/sbin:/var/lib/gems/1.8/bin
export PATH=$PATH:/Users/drewstinnett/node_modules/.bin
export PATH=$PATH:$HOME/src-remote/sysadmin-scripts
export PATH=$PATH:$HOME/src/duke-rdp
export PATH=$PATH:/Users/drews/go/bin
export PATH=$PATH:$HOME/src/sysadmin-scripts
export PATH=$PATH:$HOME/src/duke-vault-helpers/scripts
export PATH=$PATH:${HOME}/src/pynetid/scripts
export PATH=$PATH:/Library/TeX/texbin

## Iterm2 Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
#h=($h ${${${(f)"$(cmdb-cli.py ssi-linux || true)"}%%\ *}%%,*}) 2>/dev/null
#zstyle ':completion:*:ssh:*' hosts $h

#wh=()
#wh=($h ${${${(f)"$(cmdb-cli.py ssi-windows || true)"}%%\ *}%%,*}) 2>/dev/null
#zstyle ':completion:*:/Users/drewstinnett/bin/connect_windows.sh:*' hosts $h

export VAULT_ADDR=https://vault-systems.oit.duke.edu
export VAULT_TOKEN=$(cat ~/.vault-token)

eval "$(thefuck --alias)"

alias vim_plugin_install="vim +PlugInstall +qall"
alias vim_plugin_update="vim +PlugUpdate +qall"
export ANSIBLE_NOCOWS=1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C ~/bin/vault vault

export CONSUL_HTTP_ADDR=consul-sd.oit.duke.edu:8443
export CONSUL_HTTP_SSL=true
export CONSUL_CACERT=~/ca_certs/consul-sd.oit.duke.edu.ca


export KOPS_CLUSTER_NAME=drubernetes.k8s.local
export KOPS_STATE_STORE=s3://drubernetes-kops-state-store
export AWS_ACCESS_KEY=$(crudini --get ~/.aws/credentials default aws_access_key_id)
export AWS_SECRET_KEY=$(crudini --get ~/.aws/credentials default aws_secret_access_key)
export DUKE_OPENSHIFT_VAULT_TOKEN=$(cat ~/.vault-token)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PIP_EXTRA_INDEX_URL=https://piepie.oit.duke.edu/simple/

complete -o nospace -C /usr/local/Cellar/terraform/0.11.7/bin/terraform terraform

#source <(oc completion zsh)

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


complete -o nospace -C /Users/drews/bin/vault vault
