#!/usr/bin/env bash

# ======================================
# Script Name : dotfiles.sh
# Description : Sync local config files into dotfiles repo and push
# Usage       : ./dotfiles.sh
# Author      : @tonybnya
# ======================================

REPO_DIR="$HOME/dev/dotfiles"

echo "🔄 Updating dotfiles repo..."

declare -A sources=(
  ["$HOME/.tmux.conf"]="$REPO_DIR/tmux/.tmux.conf"
  ["$HOME/.tmux/plugins/"]="$REPO_DIR/tmux/plugins/"
  ["$HOME/.zshrc"]="$REPO_DIR/zsh/.zshrc"
  ["$HOME/.config/nvim/"]="$REPO_DIR/nvim/"
  ["$HOME/dev/snippets/"]="$REPO_DIR/dev/snippets/"
  ["$HOME/productivity/"]="$REPO_DIR/productivity/"
)

# Copy each file or directory into the repo
for src in "${!sources[@]}"; do
  dest=${sources[$src]}
  mkdir -p "$(dirname "$dest")"

  if [ -d "$src" ]; then
    cp -ru "$src" "$dest" && echo "📁 Synced directory: $src → $dest"
  elif [ -f "$src" ]; then
    cp -u "$src" "$dest" && echo "📄 Synced file: $src → $dest"
  else
    echo "⚠️  Skipped: $src does not exist"
    continue
  fi
done

# Change to repo directory
cd "$REPO_DIR" || { echo "❌ Failed to change to repo directory"; exit 1; }

# Ensure it's a git repo
if [ ! -d ".git" ]; then
  echo "❌ No Git repository found in $REPO_DIR"
  exit 1
fi

# Stage all changes
git add .

# Commit with a timestamped message
COMMIT_MSG="update dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"

# Push to the remote
git push && echo "🚀 Dotfiles updated and pushed successfully!"
