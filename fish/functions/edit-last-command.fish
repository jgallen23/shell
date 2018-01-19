function edit-last-command
  set -l f (mktemp)
  if set -q f[1]
    mv $f $f.fish
    set f $f.fish
  else
    # We should never execute this block but better to be paranoid.
    set f /tmp/fish.(echo %self).fish
    touch $f
  end

  echo $history[1] > $f
  if set -q EDITOR
    eval $EDITOR $f
  else
    vim $f
  end

  commandline -r (cat $f)
  commandline -C $p
  command rm $f
end
