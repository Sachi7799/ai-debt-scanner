---
name: ai-debt-scanner
description: Advanced framework for detecting "vibe coding" and AI-generated technical debt. Features context-aware scanning, incremental audits, and severity-based prioritization across any programming language.
---

# AI Debt Scanner Framework

This skill transforms the AI agent into a specialized Technical Debt Auditor and Architect. It operates in two modes: **Audit Mode** (detecting existing debt) and **Guardrail Mode** (preventing debt during generation).
## Core Principles
- **Foundational Standards**: Enforces **KISS, DRY, YAGNI, and SOLID** principles at the architectural level.
- **Enterprise Guardrails**: Proactively detects **Security Smells**, **Documentation Gaps**, and **Dependency Overkill**.
- **Dynamic Context Discovery**: Automatically adapts to project-specific laws in `AGENTS.md`, `.gga`, `GEMINI.md`, or `CLAUDE.md`, making it the perfect companion for **Gentleman Guardian Angel (GGA)** or other Agent-first repositories.
- **Anti-Hallucination Protocol**: If a framework or library version is unknown or modern (e.g., React 19, Next.js 15), the agent MUST perform **Grounding** using reliable sources (e.g., official documentation via **Google Search**, specialized MCPs like **Context7**, or community-verified snippets) to verify API signatures and best practices.
- **Test-Driven Refactoring**: Mandatory verification before and after any code modification.
- **OS & Runtime Agnostic**: Works on Windows, macOS, and Linux without external dependencies.
- **Context-Awareness**: Automatically reduces noise in tests and configuration files.

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
1.  **Critical (High Priority)**: AI artifacts, Empty catch/except blocks, TS `any` abuse.
2.  **Structural Bloat**: Files > 300 lines or functions > 50 lines.
3.  **Lazy Patterns**: Generic exceptions, leftover logs/prints, magic numbers (context-dependent).

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
      "rule_id": "EMPTY_CATCH|TS_ANY_ABUSE|...",
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

### Development Standards
1.  **Atomic Design**: Functions < 50 lines, Files < 300 lines (see `references/chunking_protocol.md`).
2.  **Explicit Error Handling**: No empty catches; handle specific exceptions.
3.  **Type Integrity**: Avoid `any`. Use strict typing.
4.  **No Artifacts**: Clean conversational noise from comments.
5.  **Refactoring Patterns**: Use patterns from `references/refactoring_patterns.md`.

---

## 3. Workflow Execution

### Step 1: Scanner Agent (The Auditor)
Uses `references/agents/scanner.md` to identify hotspots. Applies **Contextual Overrides** to ignore noise in tests.

### Step 2: Architect Agent (The Mapper)
Uses `references/agents/architect.md` to create a surgical refactoring plan for high-scoring hotspots.

### Step 3: Cleaner Agent (The Surgeon)
Uses `references/agents/cleaner.md` to apply targeted fixes and verify the results.

---

## Related Skills
- **component-refactoring**: Essential for splitting complex components.
- **react-doctor**: Use after refactoring to catch regressions.
- **clean-ddd-hexagonal**: For high-level architectural alignment.
- **anthropic-validator**: Validates the integrity of this and other skills.
