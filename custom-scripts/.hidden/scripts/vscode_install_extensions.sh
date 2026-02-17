set -- \
  maxhu.modern-tweaked \
  adpyke.codesnap \
  bradlc.vscode-tailwindcss \
  davidanson.vscode-markdownlint \
  dbaeumer.vscode-eslint \
  donjayamanne.githistory \
  editorconfig.editorconfig \
  esbenp.prettier-vscode \
  github.copilot \
  github.copilot-chat \
  github.vscode-github-actions \
  github.vscode-pull-request-github \
  huntertran.auto-markdown-toc \
  jock.svg \
  jrieken.vscode-pr-pinger \
  kuscamara.remove-unused-imports \
  mechatroner.rainbow-csv \
  ms-vscode-remote.remote-containers \
  ms-vscode.vscode-typescript-next \
  murloccra4ler.leap \
  openai.chatgpt \
  pkief.material-icon-theme \
  ritwickdey.liveserver \
  tamasfe.even-better-toml \
  tomoki1207.pdf \
  unifiedjs.vscode-mdx \
  usernamehw.errorlens \
  vscodevim.vim \
  wix.vscode-import-cost \
  yoavbls.pretty-ts-errors

for item in "$@"
do
  code --install-extension "$item"
done
