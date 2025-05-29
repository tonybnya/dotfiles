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
  dest="${files[$src]}"
  echo "🔍 Checking: $src → $dest"

  if [[ -e "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    if [[ -d "$src" ]]; then
      cp -ru "$src" "$dest"
      echo "📁 Copied directory: $src → $dest"
    else
      cp -u "$src" "$dest"
      echo "📄 Copied file: $src → $dest"
    fi
  else
    echo "⚠️  Skipped: $src (does not exist)"
  fi
done

cd "$REPO_DIR" || { echo "❌ Could not change directory to $REPO_DIR"; exit 1; }

git add .

if git diff --cached --quiet; then
  echo "✅ No changes to commit."
else
  COMMIT_MSG="update dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"
  git commit -m "$COMMIT_MSG"
  git push && echo "🚀 Dotfiles updated and pushed successfully!"
fi
