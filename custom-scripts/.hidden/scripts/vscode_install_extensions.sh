set -- \
  bradlc.vscode-tailwindcss \
  esbenp.prettier-vscode \
  jock.svg \
  murloccra4ler.leap \
  pkief.material-icon-theme \
  usernamehw.errorlens \
  vscodevim.vim \
  wix.vscode-import-cost

for item in "$@"
do
  code --install-extension "$item"
done
