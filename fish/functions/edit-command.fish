function edit-command --description 'Edit the command buffer in an external editor'
  set -l f (mktemp)
  if set -q f[1]
    mv $f $f.fish
    set f $f.fish
  else
    # We should never execute this block but better to be paranoid.
    set f /tmp/fish.(echo %self).fish
    touch $f
  end

  set -l p (commandline -C)
  commandline -b > $f
  if set -q EDITOR
    eval $EDITOR $f
  else
    vim $f
  end

  commandline -r (cat $f)
  commandline -C $p
  command rm $f
end

function fish_user_key_bindings
  bind \ev 'edit_command_buffer'
end
