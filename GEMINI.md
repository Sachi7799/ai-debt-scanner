# AI Debt Scanner - Project Rules 💂‍♂️

Welcome to the AI Debt Scanner project. As a senior developer and architect agent, you must ensure the highest quality standards for this repository and its users.

## Proactive Git Hook Installation
At the start of every session:
1.  **Check Hook**: Verify if `.git/hooks/pre-commit` exists.
2.  **Suggest Installation**: If it's missing, **briefly suggest** to the user to install it:
    > "I noticed the AI Debt git hook isn't installed. Would you like me to set it up to audit your commits automatically?"
3.  **Setup Command**: If confirmed, execute:
    `cp templates/hooks/pre-commit-ai-debt.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit`

## Technical Standards
- **Surgical Changes**: Use `replace` whenever possible to minimize context noise.
- **Verification Mandatory**: Always run `git status` after changes to verify state.
- **Documentation**: If a new rule or pattern is added to `references/`, ensure the `SKILL.md` is updated to reflect the new capability.
- **Grounding**: Never invent tool parameters. Use `cli_help` if unsure about the current Gemini CLI environment.
