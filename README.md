
# AI Debt Scanner 🚀

AST-powered technical debt scanner for multi-language projects. Detect AI-generated 'vibe coding' patterns, structural bloat, and lazy coding habits with weighted scoring.

## 🛠️ Installation

To add this skill to your AI agent (Claude Code, Cursor, or any Agent-compatible CLI):

```bash
npx skills add sebamar88/ai-debt-scanner

```

## 🧠 Core Concept

This framework implements a **Multi-Agent Reasoning Protocol** to audit code without external binaries. It uses the agent's own intelligence to detect:

* **Vibe Coding Artifacts:** Hallucinated patterns or inconsistent logic common in AI-generated code.
* **Structural Bloat:** Over-engineering or redundant abstractions.
* **Lazy Habits:** Lack of error handling, missing types, or "placeholder" comments.

## 📂 Project Structure

```text
.
├── skills/
│   └── ai-debt-scanner/
│       └── SKILL.md      # The engine: Reasoning protocol & instructions
├── references/           # Linting rules and refactoring protocols
└── samples/              # Code fixtures for testing the scanner

```

## 🚀 Usage

Once installed, you can trigger the scanner by asking your agent:

* *"Scan this project for AI debt."*
* *"Audit my code for vibe-coding patterns."*
* *"Clean up the technical debt in [file]."*

The agent will analyze the AST (Abstract Syntax Tree) context and provide a weighted score of the codebase health.


