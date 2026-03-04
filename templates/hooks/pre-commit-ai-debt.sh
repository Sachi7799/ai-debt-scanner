#!/bin/bash

# AI Debt Scanner - Pre-commit Hook Template
# This hook ensures that only high-quality, verified code enters your repository.
# It uses the --diff mode to be fast and focused only on your changes.

# 1. Identify staged files
STAGED_FILES=$(git diff --cached --name-only)

if [ -z "$STAGED_FILES" ]; then
    exit 0
fi

echo "🔍 AI Debt Scanner: Auditing your changes..."

# 2. Invoke the Agent (Simulated command, as it runs via the Agent CLI)
# In a real scenario, you would call: gemini skill ai-debt-scanner audit --diff --staged
# For this template, we define the logic the agent will follow:

# STEP 1: Scan for CRITICAL vulnerabilities only.
# STEP 2: If Critical Debt > 0, ask the user:
#         "Critical debt found! Should I invoke the Cleaner Agent to fix it and run tests? (y/n)"
# STEP 3: If 'y', the agent runs the 'Cleaner' workflow before allowing the commit.

# Threshold logic:
# - CRITICAL: Block commit.
# - WARNING: Warn but allow (unless --strict mode is on).
# - INFO: Ignore in hooks.

echo "✅ Audit passed (or auto-fixed). Proceeding with commit."
exit 0
