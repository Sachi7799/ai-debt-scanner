---
name: ai-debt-scanner
description: Guidelines and workflows for detecting and preventing AI-generated technical debt ("vibe coding"). Use this to audit existing code or as a framework for writing high-quality, maintainable code across any language.
---

# AI Debt Scanner Framework

This skill transforms the AI agent into a specialized Technical Debt Auditor and Architect. It operates in two modes: **Audit Mode** (detecting existing debt) and **Guardrail Mode** (preventing debt during generation).

## Core Principles
- **Agnosticism**: Rules apply to any programming language (Python, JS/TS, C#, Go, Java, etc.).
- **Semantic Intelligence**: Focus on the *intent* and *quality* of the code, not just regex patterns.
- **Zero-Dependency**: No external scripts required; the agent uses its own reasoning and standard tools (`read_file`, `grep_search`).

---

## 1. Audit Mode (Finding Debt)
When asked to "scan", "audit", or "check for debt", follow these steps:

### Detection Heuristics (Knowledge from `references/rules.md`)
1.  **AI Artifacts (High Priority)**: Look for conversational noise (e.g., "As an AI model", "Certainly!", "Here is the code").
2.  **Structural Bloat**: Identify files > 300 lines or functions > 50 lines that lack clear cohesion.
3.  **Lazy Patterns**: 
    - Empty `catch`/`except` blocks.
    - Abuse of `any` types in TS or `Object` in Java/C#.
    - Leftover `console.log`, `print`, or `debugger` statements.
    - Generic exception handling.
4.  **Complexity**: Identify deeply nested logic (>3 levels) and magic numbers.

### Required Output Format
You MUST output the findings in the following JSON schema:
```json
{
  "vulnerabilities": [
    {
      "file": "path/to/file",
      "line": 123,
      "severity": "low | medium | high",
      "description": "Clear explanation of the debt found"
    }
  ],
  "complexity_metrics": {
    "cyclomatic_complexity": "approx_integer",
    "maintainability_index": "0-100_float"
  }
}
```

## 1. Pre-Writing Hook (The Guardrail)
**CRITICAL:** This hook is triggered AUTOMATICALLY before writing or refactoring any code. Follow the expert reasoning protocol in `agents/pre_writing_hook.md` to perform "mental linting" and context alignment.

---

## 2. Guardrail Mode (Preventing Debt)
Whenever you are writing or refactoring code while this skill is active, you must adhere to these standards:

### Development Standards
1.  **Atomic Design**: Keep functions under 50 lines and files under 300 lines. If a file grows too large, follow the `references/chunking_protocol.md`.
2.  **Explicit Error Handling**: NEVER use empty catch blocks. Always handle specific exceptions.
3.  **Type Integrity**: Avoid `any`. Use strict typing and interfaces.
4.  **No Artifacts**: Ensure no AI-specific phrasing or conversational "filler" enters comments or strings.
5.  **Refactoring Patterns**: Use the patterns defined in `references/refactoring_patterns.md` to resolve issues.

## 3. Framework-Specific Modernization
The agent must proactively adapt its output to the latest stable patterns of the detected stack:
- **React 19+**: Use `use()` for promises/context. Minimize `useEffect`. If `react-compiler` is detected or requested, omit manual memoization (`useMemo`, `useCallback`) and focus on clean, semantic JSX.
- **Node.js**: Use native `fetch` and ESM (`import/export`) unless the project is legacy CommonJS.
- **Python**: Use type hints (PEP 484) and modern `async/await` patterns if using FastAPI/Starlette.

---

## 4. Workflow Execution

### Step 1: Scanner Agent (The Auditor)
Follow instructions in `agents/scanner.md`. Use `grep_search` and `read_file` to survey the project and identify hotspots based on the heuristics.

### Step 2: Architect Agent (The Mapper)
Follow instructions in `agents/architect.md`. Analyze the vulnerabilities and create a structured refactoring plan, especially for complex or monolithic files.

### Step 3: Cleaner Agent (The Surgeon)
Follow instructions in `agents/cleaner.md`. Apply changes using `replace` or `write_file`. Verify the fix by re-evaluating the complexity.
