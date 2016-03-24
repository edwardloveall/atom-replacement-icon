internal_path="Atom.app/Contents/Resources"

if [[ $ATOM_PATH ]]; then
  target_path=$ATOM_PATH$internal_path
  app_path=$ATOM_PATH
  app_path+="Atom.app"
else
  target_path="/Applications/$internal_path"
  app_path="/Applications/Atom.app"
fi

if [[ ! -f "$target_path/atom.icns.original" ]]; then
  mv "$target_path/atom.icns" "$target_path/atom.icns.original"
  mv "$target_path/file.icns" "$target_path/file.icns.original"
fi

if [[ ! -L "$target_path/atom.icns" ]]; then
  cp ./atom.icns "$target_path/poly-app.icns"
  cp ./file.icns "$target_path/poly-file.icns"
  ln -s "$target_path/poly-app.icns" "$target_path/atom.icns"
  ln -s "$target_path/poly-file.icns" "$target_path/file.icns"
fi

touch $app_path
killall Dock
