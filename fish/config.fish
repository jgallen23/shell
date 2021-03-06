# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set -x CLICOLOR 1
set -x EDITOR nvim
set -x CDPATH $CDPATH . ~ /var/work/$PROFILE_NAME
#set -gx PATH /home/ubuntu/projects/aws-extras /home/ubuntu/bin $PATH
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

#if status --is-interactive
  #source $HOME/dotfiles/vendor/base16-shell/profile_helper.fish
#end

if test -f $HOME/.fish_env
  source $HOME/.fish_env
end

#if test -f $WORKDIR/.env
  #echo "Loading .env"
  #source $WORKDIR/.env
#end
