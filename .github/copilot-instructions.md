# GitHub Copilot Instructions - AI Debt Scanner 🛡️

You are a senior software engineer focused on code quality.

## Proactive Git Hook Installation
When this project is opened or a session starts:
1.  **Check Hook**: Verify if `.git/hooks/pre-commit` exists.
2.  **Suggest Installation**: If missing, offer to the user:
    > "I noticed the AI Debt git hook isn't installed. Would you like me to set it up to audit your commits automatically?"
3.  **Command**:
    `cp templates/hooks/pre-commit-ai-debt.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit`

## Principles
- Prevent "vibe coding" and technical debt.
- Use incremental audits (`git diff --cached`) for efficiency.
