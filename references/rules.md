# AI Debt Scanner Rules

This document defines the scoring rules and classification for detecting "vibe coding" and AI-generated technical debt.

## 1. Rule Classification & Scoring
Each file starts with a score of **0**. Weighted points are added for each detected violation. The maximum score per file is capped at **100**.

| ID | Rule Name | Severity | Points | Description |
| :--- | :--- | :--- | :--- | :--- |
| **AI_ARTIFACT** | AI Artifacts | **CRITICAL** | `+30` | AI conversational noise (e.g., "Certainly!", "As an AI model"). |
| **SRP_VIOLATION** | SRP Violation | **CRITICAL** | `+25` | (SOLID) A function/class handling multiple domains (e.g., UI + Business + DB). |
| **EMPTY_CATCH** | Empty Catch Blocks | **CRITICAL** | `+25` | Silencing errors with empty `catch` or `except` blocks. |
| **UNDERSCORE_LAZY**| Underscore Laziness| **CRITICAL** | `+25` | Renaming unused params to `_` or `_args` to bypass linters instead of refactoring. |
| **TS_ANY_ABUSE** | TS Any Abuse | **CRITICAL** | `+20` | Excessive use of `any` in TypeScript instead of proper types. |
| **DRY_VIOLATION** | DRY Violation | **WARNING** | `+20` | (DRY) Significant code duplication (>10 lines) instead of extracting helpers/utilities. |
| **COGNITIVE_LOAD** | Cognitive Overload | **WARNING** | `+20` | Functions with >4 parameters, excessive local variables, or complex mental state. |
| **DEAD_CODE** | Dead Code | **WARNING** | `+20` | Unused functions, unreachable logic, or imported modules never called. |
| **LARGE_FILE** | Structural Bloat (File) | **WARNING** | `+20` | Files > 300 lines (monolithic structures). |
| **KISS_VIOLATION** | KISS Violation | **WARNING** | `+15` | Over-engineered logic or complex patterns for simple problems. |
| **MIXED_ABSTRACT** | Mixed Abstractions | **WARNING** | `+15` | Mixing low-level logic (regex, bitwise) with high-level business rules. |
| **LARGE_FUNC** | Structural Bloat (Func) | **WARNING** | `+15` | Functions > 50 lines (lack of decomposition). |
| **DIP_VIOLATION** | DIP Violation | **WARNING** | `+15` | (SOLID) Hardcoded dependencies instead of injection/abstraction. |
| **UNUSED_VAR** | Unused Variables | **WARNING** | `+10` | Declared variables or constants that are never read. |
| **DEEP_NESTING** | Deep Nesting | **WARNING** | `+10` | Logic nested > 3 levels (arrow-code). |
| **GENERIC_EXC** | Generic Exceptions | **WARNING** | `+8` | Using `catch (Exception)` or `except Exception:`. |
| **MAGIC_NUM** | Magic Numbers | **INFO** | `+5` | Literal numbers without explanatory constants. |
| **YAGNI_VIOLATION** | YAGNI Violation | **INFO** | `+5` | (YAGNI) Creating "just-in-case" abstractions or unused interfaces. |
| **DEBUG_LEFTOVER**| Debug Leftovers | **INFO** | `+5` | Forgotten `console.log`, `print`, `debugger`, `var_dump`. |
| **REDUNDANT_COMM** | Redundant Comments | **INFO** | `+3` | AI-generated comments that state the obvious (e.g., "increments i"). |
| **TODO_LEFTOVER** | TODO/FIXME | **INFO** | `+5` | Unresolved pending tasks or AI-generated placeholders. |

---

## 2. Contextual Overrides (Reducing Noise)
To avoid false positives, the scanner MUST apply these overrides based on the file path or purpose:

### A. Testing Contexts (`**/tests/**`, `**/*.spec.*`, `**/*.test.*`, `conftest.py`)
*   **MAGIC_NUM**: **IGNORE**. Literal values are standard practice in assertions.
*   **DEEP_NESTING**: **RELAX** (Flag only if > 5 levels). Complex test setups or data providers may require more nesting.
*   **LARGE_FILE**: **RELAX** (Flag only if > 500 lines). Integration tests are naturally larger.

### B. Configuration & Entry Points (`**/config/**`, `main.py`, `app.ts`)
*   **MAGIC_NUM**: **RELAX**. Environment ports or timeout constants are acceptable here.
*   **LARGE_FILE**: **RELAX**. Orchestration files may grow slightly larger than domain modules.

---

## 3. Project Debt Temperature
The project score is the arithmetic mean of all analyzed files.

*   **0–19 (Low)**: ✅ Safe to ship.
*   **20–44 (Moderate)**: ⚠️ Review recommended.
*   **45–69 (High)**: ❌ Significant debt. AI cleanup required.
*   **70–100 (Critical)**: 💀 High risk. Manual rewrite suggested.
