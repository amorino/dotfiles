#!/bin/zsh
set -e

echo "==> Dotfiles Bootstrap"
echo ""

# 1. Check for Xcode
if ! xcode-select -p &>/dev/null; then
  echo "⚠ Xcode Command Line Tools not found. Installing..."
  xcode-select --install
  echo ""
  echo "After installation completes, re-run this script."
  echo "For formulas like swiftlint and swift-format, install full Xcode from the App Store"
  echo "then run: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
  exit 1
fi

if [ ! -d "/Applications/Xcode.app" ]; then
  echo "⚠ Full Xcode.app not found."
  echo "  Some formulas (swiftlint, swift-format) require it."
  echo "  Install from the App Store, then run:"
  echo "    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
  echo ""
  read -q "REPLY?Continue without full Xcode? [y/N] " || exit 1
  echo ""
fi

# 2. Check for 1Password SSH agent
OP_AGENT="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
if [ ! -S "$OP_AGENT" ]; then
  echo "⚠ 1Password SSH agent not found."
  echo "  1. Install 1Password from the App Store"
  echo "  2. Open 1Password → Settings → Developer → Enable 'Use the SSH Agent'"
  echo "  3. Re-run this script"
  exit 1
fi

# 3. Set up SSH config for 1Password agent
SSH_CONFIG="$HOME/.ssh/config"
mkdir -p "$HOME/.ssh"
if ! grep -q "2BUA8C4S2C.com.1password" "$SSH_CONFIG" 2>/dev/null; then
  echo "- Configuring SSH to use 1Password agent"
  cat >> "$SSH_CONFIG" <<'EOF'

# 1Password SSH Agent
Host *
  IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
EOF
  chmod 600 "$SSH_CONFIG"
fi

# 4. Verify GitHub SSH access
echo "- Verifying GitHub SSH access..."
if ! ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
  echo "⚠ GitHub SSH authentication failed."
  echo "  Make sure you have an SSH key in 1Password and it's added to your GitHub account."
  exit 1
fi

# 5. Configure git to use SSH for GitHub (fixes brew tap HTTPS clones)
echo "- Configuring git to use SSH for GitHub"
git config --global url."git@github.com:".insteadOf "https://github.com/"

# 6. Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "- Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
else
  echo "- Homebrew already installed"
fi

# 7. Run dotfiles setup
echo "- Running dotfiles setup"
make -C "$HOME/.dotfiles"

echo ""
echo "==> Done! Open a new terminal to pick up all changes."
