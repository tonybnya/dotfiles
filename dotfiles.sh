#!/usr/bin/env bash

# ======================================
# Script Name : dotfiles.sh
# Description : Sync local config files into dotfiles repo and push
# Usage       : ./dotfiles.sh
# Author      : @tonybnya
# ======================================

REPO_DIR="$HOME/dev/dotfiles"

echo "🔄 Updating dotfiles repo..."

declare -A files=(
  ["$HOME/.tmux.conf"]="$REPO_DIR/tmux/.tmux.conf"
  ["$HOME/.tmux/plugins"]="$REPO_DIR/tmux/plugins"
  ["$HOME/.zshrc"]="$REPO_DIR/zsh/.zshrc"
  ["$HOME/.config/nvim"]="$REPO_DIR/nvim"
  ["$HOME/dev/snippets"]="$REPO_DIR/dev/snippets"
  ["$HOME/productivity"]="$REPO_DIR/productivity"
)

for src in "${!files[@]}"; do
  dest=${files[$src]}
  mkdir -p "$(dirname "$dest")"

  if [ -d "$src" ]; then
    cp -ru "$src" "$dest" && echo "📁 Synced directory: $src → $dest"
  elif [ -f "$src" ]; then
    cp -u "$src" "$dest" && echo "📄 Synced file: $src → $dest"
  else
    echo "⚠️  Skipped (not found): $src"
  fi
done

cd "$REPO_DIR" || { echo "❌ Failed to change to $REPO_DIR"; exit 1; }

if [ ! -d .git ]; then
  echo "❌ This is not a git repository!"
  exit 1
fi

git add .
COMMIT_MSG="update dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"
git push && echo "🚀 Dotfiles updated and pushed successfully!"
