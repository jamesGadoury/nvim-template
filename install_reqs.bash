#!/bin/bash

# NOTE: python3-venv is required for based-pyright, black, and isort plugins

sudo apt install -y python3 python3-pip python3-venv nodejs npm git ripgrep xsel tree-sitter-cli

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Install LSP servers first (they typically take longer)
echo "Installing clangd (this may take a minute)..."
nvim --headless -c "LspInstall clangd" -c "sleep 60" -c "qall"

echo "Installing pyright (this may take a minute)..."
nvim --headless -c "LspInstall pyright" -c "sleep 60" -c "qall"

# Install additional tools with Mason
echo "Installing bash-language-server, black, and isort..."
nvim --headless -c "MasonInstall bash-language-server black isort" -c "sleep 60" -c "qall"
