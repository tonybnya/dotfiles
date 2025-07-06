#!/usr/bin/env bash

# ======================================
# Script Name : dotfiles.sh
# Description : Sync local config files into dotfiles repo and push
# Usage       : ./dotfiles.sh
# Author      : @tonybnya
# ======================================

REPO_DIR="$HOME/dev/dotfiles"

echo "🔄 Updating dotfiles repo..."

paths=(
  "$HOME/.tmux.conf|$REPO_DIR/.tmux.conf"
  "$HOME/.zshrc|$REPO_DIR/.zshrc"
  "$HOME/.config|$REPO_DIR/.config"
  "$HOME/dev/snippets|$REPO_DIR/snippets"
  "$HOME/productivity|$REPO_DIR/scripts"
  "$HOME/obsidian-vault|$REPO_DIR/obsidian-vault"
)

for pair in "${paths[@]}"; do
  IFS='|' read -r src dest <<< "$pair"
  echo "🔍 Syncing: $src → $dest"
  if [[ -e "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    if [[ -d "$src" ]]; then
      rsync -a --delete "$src/" "$dest/"
    else
      # cp -u "$src" "$dest"
      # cp -p "$src" "$dest"
      rsync -a "$src" "$dest"
    fi
    echo "✅ Synced: $src"
  else
    echo "⚠️  Skipped (not found): $src"
  fi
done

cd "$REPO_DIR" || { echo "❌ Failed to enter repo directory"; exit 1; }

git add .
COMMIT_MSG="update dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"
git push && echo "🚀 Dotfiles updated and pushed successfully!"
