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
  . $HOME/.fish_env
end

if test -f /var/work/$PROFILE_NAME/.env
  . /var/work/$PROFILE_NAME/.env
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /var/work/dev/shopify_upsell/node_modules/tabtab/.completions/serverless.fish ]; and . /var/work/dev/shopify_upsell/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /var/work/dev/shopify_upsell/node_modules/tabtab/.completions/sls.fish ]; and . /var/work/dev/shopify_upsell/node_modules/tabtab/.completions/sls.fish
