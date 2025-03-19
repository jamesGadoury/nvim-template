#!/bin/bash

# NOTE: python3-venv is required for based-pyright, black, and isort plugins

sudo apt install -y python3 python3-pip python3-venv nodejs npm git ripgrep xsel tree-sitter-cli

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
nvim --headless +"LspInstall clangd" +qall
nvim --headless +"LspInstall pyright" +qall
nvim --headless +"MasonInstall bash-language-server" +qall
