internal_path="Atom.app/Contents/Resources"

if [[ $ATOM_PATH ]]; then
  target_path=$ATOM_PATH$internal_path
  app_path=$ATOM_PATH
  app_path+="Atom.app"
else
  target_path="/Applications/$internal_path"
  app_path="/Applications/Atom.app"
fi

if [[ -L "$target_path/atom.icns" ]]; then
  rm "$target_path/atom.icns"
  rm "$target_path/file.icns"
  rm "$target_path/poly-app.icns"
  rm "$target_path/poly-file.icns"
fi

if [[ -f "$target_path/atom.icns.original" ]]; then
  mv "$target_path/atom.icns.original" "$target_path/atom.icns"
  mv "$target_path/file.icns.original" "$target_path/file.icns"
fi

touch $app_path
killall Dock
