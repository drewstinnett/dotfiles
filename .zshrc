.vimrc 

## Setup Oh my ZSH
#ZSH_THEME="terminalparty"
ZSH_THEME="aussiegeek"
#ZSH_THEME="pie"

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
plugins=(autojump git svn python ssh-agent brew brew-cask colored-man docker gnu-utils tmux \
    httpie jsontools lol vundle taskwarrior)

export EDITOR=vim
#export VMWARE_SERVER=vmware-test.oit.duke.edu
#export HOMEBREW_GITHUB_API_TOKEN=$(lpass show HOMEBREW_GITHUB_API_TOKEN --password)
## Helpful aliases
#export HOMESERVER=$(lpass show homeserver --notes)
#export FAVORITEHOST=$(lpass show favoritehost --notes)

alias ppjson="python -mjson.tool"

alias ag="ag --pager='less -FXRS'"
alias nkssh='ssh -o PubkeyAuthentication=no'
alias grep='nocorrect grep --color=auto'
alias whatd_i_do_last_week="task end.after:today-1wk completed rc.detection:off rc.defaultwidth:184"
alias whatd_i_do_last_month="task end.after:today-5wk completed rc.detection:off rc.defaultwidth:184"
alias whatd_i_do_last_day="task end.after:today-1d completed rc.detection:off rc.defaultwidth:184"
alias setup_vim='git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; vim +BundleInstall +qall'
alias use_clockworks_test='export CLOCKWORKS_BASE_URL=https://clockworks-test.oit.duke.edu'
alias use_clockworks_prod='export CLOCKWORKS_BASE_URL=https://clockworks.oit.duke.edu'
alias use_clockworks_liz='export CLOCKWORKS_BASE_URL=https://clockworks-dev-liz.oit.duke.edu'
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

eval "$(thefuck --alias)"

alias vim_plugin_install="vim +PlugInstall +qall"
alias vim_plugin_update="vim +PlugUpdate +qall"
export ANSIBLE_NOCOWS=1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

export CONSUL_HTTP_ADDR=consul-sd.oit.duke.edu:8443
export CONSUL_HTTP_SSL=true
export CONSUL_CACERT=~/ca_certs/consul-sd.oit.duke.edu.ca


export KOPS_CLUSTER_NAME=drubernetes.k8s.local
export KOPS_STATE_STORE=s3://drubernetes-kops-state-store
export AWS_ACCESS_KEY=$(crudini --get ~/.aws/credentials default aws_access_key_id)
export AWS_SECRET_KEY=$(crudini --get ~/.aws/credentials default aws_secret_access_key)
export DUKE_OPENSHIFT_VAULT_TOKEN=$(cat ~/.vault-token)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

complete -o nospace -C /usr/local/Cellar/terraform/0.11.7/bin/terraform terraform

source <(oc completion zsh)

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

