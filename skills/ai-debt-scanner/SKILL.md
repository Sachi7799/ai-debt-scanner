---
name: ai-debt-scanner
description: Advanced framework for detecting "vibe coding" and AI-generated technical debt. Features context-aware scanning, incremental audits, and architectural sentinel mode.
---

# AI Debt Scanner Framework

This skill transforms the AI agent into a specialized Technical Debt Auditor and Architect. It operates in two modes: **Audit Mode** (detecting existing debt) and **Guardrail Mode** (preventing debt during generation).

## 0. Setup & Git Hook Installation (PROACTIVE)
**CRITICAL:** At the start of a session or when detecting a git repository:
1.  **Detect Hook**: Check if `.git/hooks/pre-commit` exists and contains "AI Debt Scanner".
2.  **Proactive Suggestion**: If the hook is missing, **briefly suggest** its installation to the user: *"I noticed the AI Debt git hook isn't installed. Would you like me to set it up to audit your commits automatically?"*
3.  **Automatic Setup**: If the user says "yes" or "install it":
    -   `cp templates/hooks/pre-commit-ai-debt.sh .git/hooks/pre-commit`
    -   `chmod +x .git/hooks/pre-commit`
    -   Confirm activation.

## 0.1 Research Phase (Preventing Hallucinations)

- **Foundational Standards**: Enforces **KISS, DRY, YAGNI, and SOLID** principles at the architectural level.
- **Architectural Sentinel**: Audits cross-file dependencies to prevent layering leaks (e.g., Domain importing Infra) and high coupling.
- **Enterprise Guardrails**: Proactively detects **Security Smells**, **Documentation Gaps**, and **Dependency Overkill**.
- **Anti-Hallucination Protocol**: Mandatory grounding using reliable sources (e.g., official docs via **Google Search**, specialized MCPs like **Context7**, or community snippets) for unknown frameworks.
- **Test-Driven Refactoring**: Mandatory verification before and after any code modification. No refactor is applied without baseline and verification tests.
- **OS & Runtime Agnostic**: Works on Windows, macOS, and Linux without external dependencies.
- **Dynamic Context Discovery**: Automatically adapts to project-specific laws in `AGENTS.md`, `.gga`, `GEMINI.md`, or `CLAUDE.md`.

---

## 0. Research Phase (Preventing Hallucinations)
**CRITICAL:** Before auditing or generating code for a specific stack, if there is ANY ambiguity regarding the latest API methods:
1.  **Identify the stack** and its version.
2.  **Use the most appropriate tool** for grounding:
    - **Google Search**: For official documentation, breaking changes, and the latest releases.
    - **Specialized MCPs (e.g., Context7)**: For fast, up-to-date snippets of supported libraries.
    - **Native CLI tools**: To inspect local dependencies (`package.json`, `go.mod`, `Cargo.toml`, etc.).
This prevents "vibe coding" where the AI invents non-existent methods or uses deprecated patterns.

---

## 1. Audit Mode (Finding Debt)
When asked to "scan", "audit", or "check for debt", you can use the following specialized modes:

### Specialized Audit Commands
- **Incremental Audit (`--diff`)**: Scans only files changed in the current git branch.
- **Prioritized Audit (`--top-k <N>`)**: Reports only the top `<N>` most critical offenders.
- **Full Audit**: Scans the entire project (best for initial assessments).

### Detection Heuristics (Knowledge from `references/rules.md`)
1.  **Critical (High Priority)**: Arch violations, Security smells, AI artifacts, Empty catch/except, TS `any` abuse.
2.  **Structural Bloat**: Files > 300 lines or functions > 50 lines.
3.  **Lazy Patterns**: SRP violations, DRY violations, cognitive overload, mixed abstractions.

### Output Protocol: TOON (Token-Oriented Object Notation)
You MUST output the findings in **TOON** format. This structured, line-specific JSON allows the "Architect" and "Cleaner" agents to identify and fix issues with surgical precision without re-reading the entire file.

```json
{
  "summary": {
    "files_scanned": 0,
    "temperature": "Low|Moderate|High|Critical",
    "top_offenders": ["path/to/file"]
  },
  "vulnerabilities": [
    {
      "file": "path/to/file",
      "line": 123,
      "rule_id": "ARCH_VIOLATION|SRP_VIOLATION|...",
      "severity": "CRITICAL|WARNING|INFO",
      "description": "Clear explanation of the debt found"
    }
  ]
}
```

---

## 2. Guardrail Mode (Preventing Debt)
Automatically active during code generation or refactoring.

### Pre-Writing Hook
**CRITICAL:** Before any file modification, follow the protocol in `references/agents/pre_writing_hook.md` to ensure context alignment and prevent debt.

---

## 3. Workflow Execution

### Step 1: Scanner Agent (The Auditor)
Uses `references/agents/scanner.md` to identify hotspots. Applies **Contextual Overrides** to ignore noise in tests.

### Step 2: Architect Agent (The Sentinel)
Uses `references/agents/architect.md` to map dependencies across the project. It identifies **Architectural Violations** and creates a surgical plan for decoupling and modularization.

### Step 3: Cleaner Agent (The Surgeon)
Uses `references/agents/cleaner.md` to apply targeted fixes backed by tests.

---

## Related Skills
- **component-refactoring**: Essential for splitting complex components.
- **react-doctor**: Use after refactoring to catch regressions.
- **clean-ddd-hexagonal**: For high-level architectural alignment.
- **anthropic-validator**: Validates the integrity of this and other skills.
