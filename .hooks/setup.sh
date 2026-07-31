#!/bin/bash
# Per-clone setup. Run once after `git clone`. Idempotent — safe to re-run.

set -e

REPO_ROOT=$(git rev-parse --show-toplevel)
cd "$REPO_ROOT"

echo "[setup] $(basename "$REPO_ROOT") — applying hooks config"

# Enable the shipped hooks in this folder
git config core.hooksPath .hooks
echo "[setup] ✓ core.hooksPath = .hooks"

# Make all hooks executable
chmod +x .hooks/pre-* 2>/dev/null || true
echo "[setup] ✓ hooks executable"

echo "[setup] done. See .hooks/README.md for what each hook does."
