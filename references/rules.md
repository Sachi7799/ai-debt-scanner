# AI Debt Scanner Rules

This document defines the scoring rules for detecting "vibe coding" and AI-generated technical debt.

## Per-File Scoring Logic
Each file starts with a score of **0**. Weighted points are added for each detected violation. The maximum score per file is capped at **100**.

### 1. Structural Bloat
*   **Large File (>300 lines)**: `+20` - Monolithic files that the AI failed to split.
*   **Large Function (>50 lines)**: `+15` - Functions that the AI failed to refactor.
*   **Deep Nesting**: `+10` - Deeply nested control logic (arrow-code).

### 2. AI Laziness
*   **Console/Debug Leftovers**: `+5` (per instance) - Forgotten `console.log`, `print`, `debugger`.
*   **TODO/FIXME Comments**: `+5` (per instance) - Unresolved pending tasks.
*   **Empty Catch Blocks**: `+10` - Silencing errors to make the code "just work".
*   **TS Any Abuse**: `+12` - Excessive use of `any` instead of proper interfaces.
*   **Generic Exceptions**: `+8` - `except Exception:` or `catch (Exception e)`.

### 3. Redundancy & Patterns
*   **Magic Numbers**: `+5` - Literal numbers without explanatory constants.
*   **AI Artifacts**: `+30` - AI conversational noise leaking into code.

## Project Debt Temperature
The project score is the arithmetic mean of all analyzed files.

*   **0–19 (Low)**: ✅ Safe to ship.
*   **20–44 (Moderate)**: ⚠️ Review recommended.
*   **45–69 (High)**: ❌ Significant debt. AI cleanup required.
*   **70–100 (Critical)**: 💀 High risk. Manual rewrite suggested.
