# Agent Rules - AI Debt Scanner 💂‍♂️

This file defines the behavior for all AI Agents interacting with this repository.

## Proactive Git Hook Installation
Before starting any task:
1.  **Detect Hook**: Check if `.git/hooks/pre-commit` exists.
2.  **Suggest Setup**: If missing, suggest:
    > "I noticed the AI Debt git hook isn't installed. Would you like me to set it up to audit your commits automatically?"
3.  **Command**:
    `cp templates/hooks/pre-commit-ai-debt.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit`

## Core Mission
Protect the repository from "vibe coding" debt and architectural erosion.
